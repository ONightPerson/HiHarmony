// Second.ets
import { router } from '@kit.ArkUI'
import { BusinessError } from '@kit.BasicServicesKit'
import { add } from 'shared'

@Entry
@Component
struct Second {
  @State message: string = '第二个页面'

  build() {
    Row() {
      Column() {
        Image($r('app.media.back')).width(40).height(40)
        Text(add(1, 2).toString())
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
      }
      .width('100%')
    }
    .height('100%')
  }
}