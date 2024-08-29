import { faceDetector } from '@kit.CoreVisionKit';

@CustomDialog
export struct CommonDialog {
  cancel?: () => void
  confirm?: () => void
  controller: CustomDialogController

  build() {
    Column() {
      Text('标题')
        .fontSize(20)
        .margin({ top: 10, bottom: 10 })
      Flex({ justifyContent: FlexAlign.SpaceAround }) {
        Button('cancel')
          .onClick(() => {
            this.controller.close();
            if (this.cancel) {
              this.cancel();
            }
          })
          .backgroundColor(0xFFFFFF).fontColor(Color.Black)
        Button('confirm')
          .onClick(() => {
            this.controller.close();
            if (this.confirm) {
              this.confirm()
            }
          }).backgroundColor(0xFFFFFF).fontColor(Color.Brown)
      }.margin({ bottom: 10 })
    }

  }
}