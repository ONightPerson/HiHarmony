class ClassA {
  public value: string;

  constructor(value: string) {
    this.value = value;
  }
}

class Model {
  public value: string;
  public name: ClassA;
  constructor(value: string, a: ClassA) {
    this.value = value;
    this.name = a;
  }
}

@Component
export struct StateWatcher {
  @State title: Model[] = [new Model('Hi', new ClassA('ArkUI'))]
  build() {
    Column() {
      Text(this.title[0].value)
      Text(this.title[0].name.value)
      Button("点击改变属性").onClick(() => {
        // this.title[0] = new Model('Hello', new ClassA('ArkTS'))
        this.title.pop()
      })
    }
  }
}