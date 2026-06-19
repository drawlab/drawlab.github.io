# DrawLab

DrawLab is a focused, monochrome drawing and presentation workspace built on top of Excalidraw. It keeps the familiar hand-drawn canvas, removes non-essential interface noise, and adds a tighter workflow for sketching, framing, presenting, and inserting icons.

Live app:

https://drawlab.github.io/

## What DrawLab changes

DrawLab is not a generic Excalidraw mirror. It is a tailored fork designed around a calmer, faster workspace:

- A monochrome interface with soft grey, white, and black accents.
- A simplified main screen without welcome clutter, marketing panels, social links, or signup prompts.
- Presentation mode built around Excalidraw frames.
- A dedicated DrawLab Icon Picker with Tabler Icons and curated sketch libraries.
- Direct toolbar access to tools that are usually hidden or secondary.
- Responsive controls that move the menu, zoom, undo/redo, and presentation entry points into a bottom bar on smaller screens.
- A local Chrome/Brave New Tab extension build that runs DrawLab from the extension bundle instead of redirecting or embedding the website.

## Highlights

### Minimal workspace

The canvas stays central. Tool chrome is reduced to the parts that are useful while drawing: shapes, frames, embed, laser, lasso, Mermaid, icon picker, zoom, undo/redo, menu, and presentation.

### Presentation mode

Frames become slides. Elements that persist between frames can animate between states, making it possible to build lightweight visual presentations directly on the canvas.

If no frames exist, DrawLab shows a quiet visual empty state instead of instructional copy.

### Icon Picker

DrawLab includes a custom icon picker designed for fast diagramming:

- Tabler Icons are indexed and lazy-loaded from static assets.
- Sketch libraries are loaded from `.excalidrawlib` files.
- Search is built into the picker.
- The panel stays stable while filtering results.
- The picker closes automatically after insertion.

### Keyboard shortcuts

- `/` opens the Icon Picker.
- `M` opens Mermaid.
- `S` activates Lasso selection.

## Running locally

Requirements:

- Node.js 18 to 22.
- Yarn 1.x.

Install dependencies:

```
yarn install
```

Start the development server:

```
yarn start
```

Build the web app:

```
cd excalidraw-app
node ../node_modules/vite/bin/vite.js build
```

The production output is written to:

```
excalidraw-app/build
```

## Deployment

The public site is deployed to GitHub Pages from the `drawlab/drawlab.github.io` repository.

- Source branch: `smart-presentations`
- Pages branch: `gh-pages`
- Live URL: `https://drawlab.github.io/`

A convenience script is available:

```
deploy.bat
```

The script builds the app, copies the production output, and force-pushes the generated site to the `gh-pages` branch.

## Browser extension

DrawLab also has a Chrome/Brave New Tab extension wrapper.

The extension is intentionally not a redirect and not an iframe. It bundles the built DrawLab app and runs it from the extension origin:

```
chrome-extension://<extension-id>/index.html
```

Build and validate the extension from the extension wrapper repository:

```
cd path/to/drawlab-newtab
node scripts/build-extension.mjs
node scripts/validate-extension.mjs
```

If the DrawLab web build already exists, rebuild the extension package only:

```
node scripts/build-extension.mjs --skip-app-build
node scripts/validate-extension.mjs
```

Load the extension locally:

1. Open `chrome://extensions/` or `brave://extensions/`.
2. Enable Developer mode.
3. Choose Load unpacked.
4. Select the extension `dist` directory.

## Important files

- `excalidraw-app/index.scss` — DrawLab layout, monochrome styling, responsive bottom controls.
- `excalidraw-app/presentation/Presentation.tsx` — presentation mode.
- `excalidraw-app/presentation/Presentation.scss` — presentation visuals and empty state.
- `packages/excalidraw/components/DrawLabIconPicker.tsx` — icon picker behavior.
- `packages/excalidraw/components/DrawLabIconPicker.scss` — icon picker styling.
- `packages/excalidraw/components/DrawLabIconPicker.state.ts` — shared picker state for shortcuts.
- `packages/excalidraw/components/LayerUI.tsx` — toolbar, menu, and picker placement.
- `packages/excalidraw/components/Actions.tsx` — DrawLab-specific action bindings.
- `packages/common/src/keys.ts` — shared key constants.
- `scripts/generate-drawlab-icon-assets.mjs` — generates icon picker assets under `public/drawlab-icon-picker/`.

## Development notes

Use targeted formatting instead of formatting the entire repository when only a few files changed:

```
./node_modules/.bin/prettier --write <file1> <file2>
```

Run type checking:

```
yarn test:typecheck
```

Build the app:

```
cd excalidraw-app
node ../node_modules/vite/bin/vite.js build
```

## Related repositories

- Public site and source branch: `drawlab/drawlab.github.io`
- New Tab extension wrapper: `nguyendinhquocx/code-extension`
- Upstream project: `excalidraw/excalidraw`
