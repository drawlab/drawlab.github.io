import { Button, Footer } from "@excalidraw/excalidraw/index";
import React, { useCallback } from "react";
import { useI18n } from "@excalidraw/excalidraw/i18n";
import { useExcalidrawActionManager } from "@excalidraw/excalidraw/components/App";
import { actionPresent } from "@excalidraw/excalidraw/actions";

export const AppFooter = React.memo(
  ({ onChange: _onChange }: { onChange: () => void }) => {
    const { t } = useI18n();
    const actionManager = useExcalidrawActionManager();
    const onPresent = useCallback(
      () => actionManager.executeAction(actionPresent),
      [actionManager],
    );

    return (
      <Footer>
        <div className="drawlab-footer-actions">
          <Button
            onSelect={onPresent}
            style={{ width: "fit-content" }}
            className="drawlab-present-button"
          >
            {t("labels.present")}
          </Button>
        </div>
      </Footer>
    );
  },
);
