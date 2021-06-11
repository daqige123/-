#### 回溯算法框架

![image-20210529103733362](C:\Users\24026\AppData\Roaming\Typora\typora-user-images\image-20210529103733362.png)

```java
// 数字的全排列
ArrayList<ArrayList<Integer>> res = new ArrayList<>();
public ArrayList<ArrayList<Integer>> permute(int[] nums) {
    ArrayList<Integer> track = new ArrayList<>();
    backtrace(nums, track);
    return res;
}
void backtrace(int nums[], ArrayList<Integer> track) {
    if(track.length == nums.length) {
        res.add(track);
        return;
    } 
    for (int i = 0; i < nums.length; i++) {
        // 排除不合法的选择
        if (track.contains(nums[i]))
            continue;
        track.add(nums[i]);
        // 进入下一层决策树
        backtrace(nums, track);
        // 取消选择
        track.removeLast();    
    }
    
}



```

### 模块化的导入导出

#### 1.export { flag, sum }

==> import{flag, sum} from "./aaa.js"

#### 2.export let flag = true

==> import {flag} from "./aaa.js"

#### 3. export function sum ( num1, num2) { return num1 + num2}  // 导出函数

####     export class Person  {}  // 导出类

==> import {sum, Person} from "./aaa.js"

#### 4. export default funtion(arg) { console.log(arg);}

==> import addr from "./aaa.js"



