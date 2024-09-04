import { ComplexTypeTest } from './ComplexTypeTest'

@Component
export struct PropWatcher {
  build() {
    Column() {
      ComplexTypeTest()
    }
  }
}

