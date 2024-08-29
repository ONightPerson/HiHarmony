import { router } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import { RoundButton } from '../component/RoundButton'
import { TitleBar } from '../component/CommonComp'
import { AnimatablePropertyExample } from '../component/AnimatablePropertyExample'
import { StateWatcher } from '../component/StateWatcher'
// import { MainPage } from 'library'

@Entry
@Component
struct Index {
  @State private message: string = 'Liu Bao zhu';
  @State btnText: string = "进入第二个页面";
  submit: () => void = () => {

  }

  onPageShow(): void {
    console.info("首页 onPageShow")
  }

  onPageHide(): void {
    console.info('首页 onPageHide')
  }

  onBackPress(): boolean | void {
    console.info("首页 返回")
  }

  build() {
    Row() {
      Column() {
        TitleBar()
        Button('测试私有自定义构建函数').onClick(() => {
          router.pushUrl({ url: 'pages/PageBuilder' })
        })
        AnimatablePropertyExample()
        StateWatcher()
        RelativeContainer() {
          Text(this.message)
            .id('HelloWorld')
            .fontSize(50)
            .fontWeight(FontWeight.Bold)
            .alignRules({
              center: { anchor: '__container__', align: VerticalAlign.Center },
              middle: { anchor: '__container__', align: HorizontalAlign.Center }
            })
          RoundButton({ btnName: '进入下一页', submitArrow: this.submit })
            .id('go_to_second')// .type(ButtonType.Capsule)
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
              router.pushUrl({ url: 'pages/Second' }).then(() => {
                console.log('Succeeded in jumping to the second page')
              }).catch((err: BusinessError) => {
                console.error(`Failed to jump to second page.Code is ${err.code}, message is${err.message}`)
              })
            })

          // MainPage()
        }
        .height('100%')
        .width('100%')
        .padding({ left: 16, right: 16 })
      }
      .height('100%')
      .padding({ left: 16, right: 16 })
    }
    .width('100%')
    .alignItems(VerticalAlign.Top)

  }
}