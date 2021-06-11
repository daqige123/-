### promise
  js是一门单线程语言，所以采用了不断轮询机制来处理异步请求，就是说我们一有异步操作，我们就将任务扔进一个事件队列中, 继续执行后面的代码（主任务执行完毕），然后再去事件队列中轮询，看看有没有新的任务。




### 事件循环、任务的执行规则
##### js遇到同步任务直接执行（主线程），异步任务则进入任务队列。主线程的仍无执行完毕为空后，才会去任务队列中读取对应的任务，然后推入主线程执行。这个过程的不断重复就叫事件循环。
#### 异步任务分为宏任务和微任务
##### 宏任务：整体的script, setTimeout setInterval
##### 微任务： Promise, process.nextTick

#### 先执行一个宏任务，等到这个宏任务执行完毕，然后将所有可执行的微任务全都执行完毕后再执行下一个宏任务。

```js
// 这是一个同步任务
console.log('1')            --------> 直接被执行
                                      目前打印结果为：1

// 这是一个宏任务
setTimeout(function () {    --------> 整体的setTimeout被放进宏任务列表
  console.log('2')                    目前宏任务列表记为【s2】
});

new Promise(function (resolve) {
  // 这里是同步任务
  console.log('3');         --------> 直接被执行
  resolve();                          目前打印结果为：1、3
  // then是一个微任务
}).then(function () {       --------> 整体的then[包含里面的setTimeout]被放进微任务列表
  console.log('4')                    目前微任务列表记为【t45】
  setTimeout(function () {
    console.log('5')
  });
});

第一轮小结：
执行到这里的结果：1、3

宏任务列表如下：
setTimeout(function () {
  console.log('2')
});

微任务列表如下：
then(function () {
  console.log('4')
  setTimeout(function () {
    console.log('5')
  });
});
```





### promise

promise比单纯的回调（很多重嵌套的时候会形成回调地狱）更优雅。？？？

##### 1. 三种状态：

 pedding 待定状态， 比如正在进行网络请求，定时器时间没有到，都得等待。

rejected 拒绝 ==> error  当我们主动回调了resolve时，就处于这种状态，并且会回调.then().

fulfilled  满足==> data   当我们主动回调了reject时, 就处于该状态，并且会回调.catch().

期约的状态只能改变一次。所以

```js
let p = new Promise((resolve, reject)=> {
    resolve(data);  // 这里传给resolve的data会自动传给then里面的fun1（data）。
    reject(error); //期约的状态只能改变一次。所以这句话是无效的。
}).then(fun1(data), fun2(error));
```

##### 2.为避免期约卡在待定状态，可以添加一个定时退出功能

```js
let p1 = new Promise((p1, p2)=> {
    setTimeout(p2, 10000); // 10s后就直接调用reject
})
```

##### 3. 期约连锁

```js
 setTimeout(function () {
            console.log("第一个回调！");
            setTimeout(function () {
                console.log("第二个回调！");
                setTimeout(function () {
                    console.log("这是第3个回调！")
                    setTimeout(console.log("这是第四个回调！"), 1000)
                }, 1000)
            }, 1000)
        }, 1000);

        let p1 = new Promise((p1, p2) => {
            console.log("第一个promise回调！")
            setTimeout(p1, 1000)
        })
            .then(() => new Promise((p1, p2) => {
                console.log("第2个promise回调！")
                setTimeout(p1, 1000)
            }))
            .then(() => new Promise((p1, p2) => {
                console.log("第3个promise回调！")
                setTimeout(p1, 1000)
            }))
            .then(() => new Promise((p1, p2) => {
                console.log("第4个promise回调！")
                setTimeout(p1, 1000)
            })).then(setTimeout(console.log("第五个promise回调！"), 1000))
```

##### 4. promise.all()

两个期越都解决，才能进行.then()

promise.all()就是传入一个promise数组,然后.then(result=>{})里面的result也是一个数组，包含了两个期越传入的值。

```js
let pAll = Promise.all([
            new Promise((resolve, reject) => {
                setTimeout(resolve({ name: 'daqige', age: 25 }), 2000);
            }),

            new Promise((resolve, reject) => {
                setTimeout(resolve({ name: '张政', age: 25 }), 1000);
            }),

        ])
        pAll.then(
            result => {
                console.log(result)
                console.log(result[1])
            }
        );
```

##### 5. Promise.race()

与Promise.all()相似，但是.then只执行状态先落定的期约的镜像。

#### async await

 async 用于申明一个 function 是异步的，而 await 用于等待一个异步方法执行完成。

await 只能出现在 async 函数中

1. await后面接一个会return new promise的函数并执行它
