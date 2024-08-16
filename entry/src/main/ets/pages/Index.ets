import { router } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct Index {
  @State message: string = 'Liu Bao zhu';
  @State btnText: string = "进入第二个页面";

  build() {
    RelativeContainer() {
      Text(this.message)
        .id('HelloWorld')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
      Button(this.btnText)
        .id('go_to_second')
        .type(ButtonType.Capsule)
        .alignRules(
          {
            bottom: { anchor: '__container__', align: VerticalAlign.Bottom },
            middle: { anchor: '__container__', align: HorizontalAlign.Center },
          }
        )
        .margin({
          bottom: 200,
        })
        .onClick(() => {
          console.log("click to jump to the second page")
          router.pushUrl({url: 'pages/Second'}).then(() => {
            console.log('Succeeded in jumping to the second page')
          }).catch((err: BusinessError) => {
            console.error(`Failed to jump to second page.Code is ${err.code}, message is${err.message}`)
          })
        })
    }
    .height('100%')
    .width('100%')
  }
}