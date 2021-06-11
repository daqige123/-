### 什么是Vue



<!-- 

  v-bind 绑定元素属性。 <span v-bind:title="message">

  v-if 条件渲染。 <p v-if="seen">

  v-for 将这个元素循环，<ol> <li v-for="todo in todos"> {{todo.text}} </li> </ol>

  这里的循环就需要一个数组来保持。

  data里面注册变量其实不是data的属性，而是Vue实例的一个属性了。

  v-on 绑定事件 

  v-model 实现表单输入和应用状态之间的双向绑定。

  组件

  Vue.component('todo-item', {

​    template: '<li>这是一个待办事项</li>'

  })

  可以通过给组件添加一个“prop” 的属性来将li里面的内容动态变化。

 -->

### Vue实例

##### 1. 当一个Vue实例被创建时，它将data对象中所有的property 加入到Vue的响应式系统中。当这些property的值发生改变时，试图也会产生响应，即匹配更新为新的值。

意思就是我们将一个对象或者变量赋值给VM的data了，那么这个对象或变量
（例如a）就成为了vm的属性了，用vm.a 来赋值也会改变外面的a的值。

##### 2. {{}}不能应用到元素标签的属性里面，所以我们想要让用变量来控制元素的属性值，的用v-bind:来绑定元素属性然后将变量名赋值给属性。

##### 3. {{}} 里面可以直接跟单句js表达式.



#### 计算属性 computed和methods的区别

两种方式的结果是一样的，但是computed是基于它们的响应式依赖进行缓存的，只有在相关响应式依赖发生改变时他们才会重新求值。这就意味着，只要message只要还没发生改变，多次访问reverseMessage计算属性会立即返回之间缓存的计算结果，而不必再次执行函数。相比之下，每当触发重新渲染时，调用方法时，总会重新执行函数。



#### v-bind

```js
<!-- 第一种使用场景 绑定属性class, title等，来用变量动态赋值-->
        <div v-bind:class="fuzhi" style="width:200px; height: 200px; text-align: center; line-height: 200px; ">
            hello Vue!
        </div>
        <!-- 第二种常见使用场景 绑定内联样式 style -->
        <div v-bind:style="{color: activeColor, fontSize: fontSize + 'px'}"> </div>
```

#### v-if 和v-show的区别

v-if 是条件渲染，只有当if条件成立时才会开始渲染，条件不成立时，组件或元素就会被销毁。而 v-show 渲染的元素会始终保留在Dom中，然后根据值的不同只是简单的切换元素的css属性的display的值。

一般来说，`v-if` 有更高的切换开销，而 `v-show` 有更高的初始渲染开销。因此，如果需要非常频繁地切换，则使用 `v-show` 较好；如果在运行时条件很少改变，则使用 `v-if` 较好。

