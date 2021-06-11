### 组件

#### 注意事项:

1. 组件里面定义多个标签的话，需要用一个div将他们包起来。
2.  vue 组件里面的驼峰命名转换如： myTitle =>  my-title

3. 在子组件中，通过$emit()来触发事件，再父组件中通过v-on来监听子组件事件。

![image-20210527160629855](C:\Users\24026\AppData\Roaming\Typora\typora-user-images\image-20210527160629855.png)

##### 子组件传值给父组件过程:

首先我们data(){}这里面要有数据, 比如说是一个对象数组.然后我们在<template>里面可以使用v-for 来显示数组的所有对象, 然后给每个item(数组中的对象)绑定一个点击事件,然后在组件的methods里面定义点击事件的函数.在函数中,  this.$emit('事件名',  item),这就是组件创建一个新事件.  最后我们就可以在父组件中调用子组件的时候, 在子组件中监听并且用v-on绑定这个事件,给事件绑定一个函数 如: rd(), 就可以在父组件的methods里面操作传来的item了.

##### 父组件传给子组件:

首先在子组件里需要定义一些属性来专门接收父组件传过来的数据, 如: props:["name", " id"], 这就直接传过来了,然后我们就直接通过属性来显示这些值. {{name}}, {{id}}.



#### 数据双向绑定简单实现

```js
<input type="text" id="input">
    <p id="p"> </p>
    <script>
        // 数据
        let obj = {};
        obj.name = "data";
        // 元素（view）
        let input = document.querySelector("#input");
        let p = document.querySelector("#p");

        // 数据变化==》view（元素的属性值改变）
        Object.defineProperty(obj, 'name', {
            get() {
                return val;
            },
            set(newVal) {
                input.value = newVal;   // 数据改变 ===> view改变
                p.innerHTML = newVal;   // 数据改变 ===> view改变
            }
        });

        // 元素属性值改变了=》 数据变化 
        input.addEventListener("input", function (even) {
            obj.name = even.target.value;  // 将用户输入的数据赋值给对象的属性。 
        })

    </script>
```

<input type=text v-model="message">  等价于 

<input type=text  :value="message",   @input="$even.target.value">





{data:{	message: "hello"}}



input input.value===> message



let obj = {name:"helloworld!"}

dom.addLisenEvent('input',  function(e) {

​	   		obj.name = e. target.value;

}) 

measage,  ==>  input的变化

Object.defineProperty(obj,  'name', {

​			set () {

​            }

​	})

##### 父组件模板的所有东西都会在父级作用域内编译，子组件模板的东西都会在子级作用域内编译。

#### 作用域插槽：准备

父组件替换插槽的标签，但是内容由子组件来提供。

