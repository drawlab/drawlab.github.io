# Hướng dẫn cập nhật drawlab.github.io

## Thông tin project

- Source code: `D:\pcloud\workspace\code\window\excalidraw-smart-presentation`
- Site: https://drawlab.github.io/
- Repo: https://github.com/drawlab/drawlab.github.io
- Branch code: `smart-presentations` (default)
- Branch deploy: `gh-pages` (GitHub Pages serve từ đây)
- Repo gốc: https://github.com/excalidraw-smart-presentation/excalidraw-smart-presentation.github.io

## Flow cập nhật

### 1. Sửa code

Mở project trong editor, sửa code trên branch `smart-presentations`.

### 2. Commit + push code

```
git add .
git commit -m "mô tả thay đổi"
git push origin smart-presentations
```

### 3. Deploy lên GitHub Pages

Cách nhanh — chạy script:

```
deploy.bat
```

Script sẽ tự build + copy file build lên `gh-pages` branch + push.

Cách thủ công:

```
cd excalidraw-app
node ../node_modules/vite/bin/vite.js build
```

Sau đó copy nội dung thư mục `excalidraw-app/build/` ra temp, tạo `.nojekyll`, init git, push lên `gh-pages`:

```
rmdir /s /q C:\Users\quocn\AppData\Local\Temp\drawlab-pages
mkdir C:\Users\quocn\AppData\Local\Temp\drawlab-pages
xcopy /s /e /y excalidraw-app\build\* C:\Users\quocn\AppData\Local\Temp\drawlab-pages\
echo. > C:\Users\quocn\AppData\Local\Temp\drawlab-pages\.nojekyll
cd C:\Users\quocn\AppData\Local\Temp\drawlab-pages
git init
git checkout -b main
git add .
git commit -m "Deploy"
git remote add origin https://github.com/drawlab/drawlab.github.io.git
git push -f origin main:gh-pages
```

### 4. Kiểm tra

Mở https://drawlab.github.io/ — thay đổi sẽ hiện sau 1-2 phút.

## Lưu ý

- Không push code lên `gh-pages` — branch đó chỉ chứa file build
- Không push code về repo gốc của tác giả — remote đã đổi sang `drawlab`
- Nếu build lỗi `cross-env` hoặc `vite` không nhận: dùng `node ../node_modules/vite/bin/vite.js build` thay vì `yarn build`
- Site cần file `.nojekyll` ở root để GitHub Pages không render bằng Jekyll

## Pull code mới từ repo gốc

Nếu muốn sync code mới từ repo gốc:

```
git remote add upstream https://github.com/excalidraw-smart-presentation/excalidraw-smart-presentation.github.io.git
git fetch upstream
git merge upstream/smart-presentations
```

Sau đó build + deploy lại.
