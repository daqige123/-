#### 1.5 创建Vue时， option里面可以放些啥

el,   data, methods, 生命周期函数

### 计算属性与methods的区别

#### computed: 本质就是给VUE实例定义一个属性。里面有一个set, get。使用的时候就不用加括号。

computed是有缓存的，当属性里面的数据没有发生变化时，这个属性计算就只会用上一次的值，不会重新执行一次，而methods里面的方法时调用几次，每次都会执行一遍。

刚开始设计的时候，if ，for这种{}是没有作用域的，只有函数有。



#### 数组的方法

push("aa","bb")可以一次添加几个元素。, slice(), filter(), shift(), unshift()在数组最前面添加元素, sort(), reverse(),splice(开始， 删除元素个数，插入值), pop(),都会触发页面的响应式变化。

但是 this.arr[0] ="...", 这种不会触发页面响应式变化。

Vue.set(修改的对象，修改元素的索引，修改后的值)。

filter() 函数里面接受一个回调函数，每遍历一个元素，调用一次回调函数。返回满足条件的item.

<input v-model="message">  等同于
        <input type="text" :value="message" v-on:input="message=$event.target.value">

