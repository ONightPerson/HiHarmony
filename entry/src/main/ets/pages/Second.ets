// Second.ets
import { router } from '@kit.ArkUI'
import { BusinessError } from '@kit.BasicServicesKit'
// import { add } from 'shared'
import { CommonDialog } from '../component/dialog/CommonDialog'

@Entry
@Component
struct Second {
  @State message: string = '第二个页面'

  dialogController: CustomDialogController = new CustomDialogController(
    {
      builder: CommonDialog({
        cancel: () => {
          this.onCancel();
        },
        confirm: () => {
          this.onConfirm();
        },
      }),

      autoCancel: false,
      height: 200
    }
  )

  onCancel() {
    console.info("Callback when the cancel button is clicked")
  }

  onConfirm() {
    console.info('Callback when the confirm button is clicked')
  }

  build() {
    Row() {
      Column() {
        Image($r('app.media.back')).width(40).height(40)
        // Text(add(1, 2).toString())
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button() {
          Text('返回首页')
            .fontSize(25)
            .fontWeight(FontWeight.Bold)
        }
        .type(ButtonType.Capsule)
        .margin({
          top: 20
        })
        .backgroundColor('#0D9FFB')
        .width('40%')
        .height('5%')
        .onClick(() => {
          console.log('Click to return to the home page')
          try {
            router.back()
            console.log('Succeeded in returning to the home page')
          } catch (err) {
            let businessErr = err as BusinessError;
            console.error(`Failed to return to the home page. Code is${businessErr.code}, message is ${businessErr.message}`)
          }

        })

        Button() {
          Text('自定义弹窗')
            .fontSize(25)
            .fontWeight(FontWeight.Bold)
        }
        .type(ButtonType.Capsule)
        .margin({
          top: 20
        })
        .backgroundColor('#0D9FFB')
        .width('40%')
        .height('5%')
        .onClick(() => {
          this.dialogController.open();
        })

        Button() {
          Text('进入Third页面')
            .fontSize(25)
            .fontWeight(FontWeight.Bold)
        }
        .type(ButtonType.Capsule)
        .margin({
          top: 20
        })
        .backgroundColor('#0D9FFB')
        .width('40%')
        .height('5%')
        .onClick(() => {
          router.pushUrl({url: 'pages/Third'}).then(() => {
            console.info('succeeded in jumping third page')
          }).catch((err: BusinessError) => {
            console.error(`failed to jump to third page, err: ${err}`)
          })
        })
      }
      .width('100%')
    }
    .height('100%')
    .alignItems(VerticalAlign.Center)
  }
}