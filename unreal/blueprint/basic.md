- LineTraceForObjects 查找从开始位置到结束位置的物体 https://blog.csdn.net/Milow88/article/details/106609391

- GetForwardVector 返回1厘米长度的方向向量
- 速度
    - 可以移动的物体才有速度
    - Speed 只有数值没有方向
    - velocity 有方向的速度
    - 如果物体有开启物理模拟，或者有移动组件，就可以通过GetVelocity来获取它的速度矢量

- 旋转信息，UE使用的左手坐标系，采用航空标准，按照三位坐标系分为，Roll(X翻滚)、Pitch(Y俯仰)、Yaw(Z偏航)。
    - Roll、Pitch、Yaw的值都被限定在了0~360之间。
    - 向前向量的计算公式，X=Cos(Pitch)*Cos(Yaw)，Y=Cos(Pitch)*Sin(Yaw)，Z= Sin(Pitch)。
    - 向右向量的计算公式，X= Sin(Roll)*Sin(Pitch)*Cos(Yaw)-Cos(Roll)*Sin(Yaw)，Y=Sin(Roll)*Sin(Pitch)*Sin(Yaw)+Cos(Roll)*Cos(Yaw)，Z= - Sin(Roll)*Cos(Pitch)。
    - 向上向量的计算公式，X= -(Cos(Roll)*Sin(Pitch)*Cos(Yaw)+Sin(Roll)*Sin(Yaw))，Y=Cos(Yaw)*Sin(Roll) - Cos(Roll)*Sin(Pitch)*Sin(Yaw)，Z = Cos(Roll)*Cos(Pitch)

- 按住L 键，在视窗可以移动查看光的效果
- 按住Ctrl键，切换连接引脚
- 按住Alt 键，删除引脚连接
- break vector 将一个vector 值拆分开
- make vector 生成一个vector
- 网格吸附决定了物体移动时的步长
    - Snaptogrid 每个方向应用网格吸附
    - Snapvectogrid 相当于对三个方向设置snaptogrid
- Calapse to function  选中蓝图中的一部分，转换成函数
    - 如果生成的函数不会改变蓝图的流程，可以设置成pure
    - 可以在蓝图之间，拷贝粘贴函数
- 双击蓝图连接线，可以产生新的锚点，方便布局连线
- GetClass 获取一个Actor的类型
    - 可以使用 == 进行类型相等性判定
- GetDisplayName 获取Actor展示名称
- 连线颜色
    - 黄色代表vector
    - 蓝色代表单一对象引用
    - 紫色代表类引用
- Cast To 类型转换
- 蓝图类对象被创建会进入EventBeginPlay事件
- Event Tick 事件每帧调用一次
- Create Dynamic Material Instance 创建材质实例
    - Target 指定为那个actor 创建
    -  Element index ， actor 材质索引
    - Source Material 来源Material
- Set Scaler Parameter Value 设定对象参数值
- 按住S 按鼠标左键，创建Scale Paramete
- Is Valide 检查Actor 是否存在
- Add Time Line
    - 要自定义一个名字
    - Float 时间线
        - Length 时间总长度
        - Shift+左键 在时间线上增加点
            - 可以为每个点指定时间 time
            - 可以为每个点指定值 value
        - new track 当前值
    - Play 播放
    - Play from start 从头开始播放
    - Stop 停止
    - Reverse 从现在的位置回退
    - Set Time Rate 设置播放速度
- Promote to variable
    - 右键点击返回值引脚，将返回值提升为参数
- Create child blue print class 创建蓝图类的子类
    - 通过函数的override可以重栽函数
    - 不想被继承的变量可以设置成private
    - Generate Abstract class 选项设置为虚基类，这类物体不会显示在视窗中
- Get Material 获取材质对象
- Object reference 对象引用
- Class reference 类型引用
- SetRelativeRotation 设置相对旋转
    - MakeRotater 设置旋转向量
- Watch this  value 可以在调试时观察对象值
- Flip Flop 第一次执行进入A流程，第二次进入B流程
- Get World Scale
- Set World Scale 3D
- 启用lumen照明
    - project setting -> rendering -> global illuminate 选择 lumen
    - project setting -> rendering -> reflection -> reflection method  选择 lumen
- 按住alt键拖动，可以实现在指定方向拷贝
- 按住shift选择多个，然后按住alt拖动方向键，整行复制
- capsule radius 改变胶囊体半径
- post process volume 设置 infinite extent unbound 应用于整个场景
- Bridge 用于下载各种第三方资源
    - Content  add quixel bridge 打开bridge
    - low ，medium ，hige，nanite 的区别
- 按住shift 移动物体，镜头会跟着移动
- 按住shift 选择多个物体，按ctrl 从选择的物体中移除某个物体
- 选中物体右键Group 进行分组

* 从性能方面讲，蓝图比C++代码性能要低
* 执行顺序
    - construction script
    - event graph
* 断开事件链接
    - Alt+ 鼠标点击链接点
* 添加注释
    - 选中一个或者几个组件，右键 add comments 。。。，或者快捷键C
* collapse nodes
    - 将一组节点缩成一个
    - 可以增加output 和 input
* 调整连线
    - 双击事件连线上的一个点，产生一个注释点，拖拽这个注释点梳理连线，或者添加注释
* 图形颜色
    - event 红色    
    - construction script 紫色
    - macro 灰色
    - 函数 蓝色

* 变量类型
    - Name 常用于不变的字符串
    - String 常用于可变字符串
    - Text 常用于包含参数的字符串例如 Welcome，{PlayerName}
* 提升到参数 promote to variable
    - 选择一个参数引脚，右键，promote to variable 用当前的引脚名生成参数
* 字符串函数
    - Append 连接
    - ToUpper 大写
    - ToLower 小写
    - Equal Exactly 相等
    - Contains 包含
* 浮点数除法
    - Safe Divide
* 变量作用域
    - private 只能在本蓝图中使用
    - 非 private 可以在所有蓝图中使用
        - 非子类
            - 通过 create reference to 创建蓝图的引用
            - 通过引用访问变量
        - 子类
            - 直接访问变量
    - 在场景详细面板访问变量（只针对当前的对象有效）
        - 设置变量instance editable，指定对应的category ，默认Default
        - 在场景中指定的category 中可以看到变量
    - 在spawn 中访问变量
        - 勾选 expose on spawn
* 自增
    - ++ 给传入的参数加1
* 开启键盘输入
    - Enable Input
    - Get Player Controller
* Delay 延迟
* 数组操作
    - Get 从数组中获取元素，参数是下标
    - Find 返回查找到元素的下标，找不到返回 -1
    - Length 获取数组长度
    - Last Index 数组最后的下标
    - Contains 是否包含某个item，返回true或者false
    - Insert 在指定下标插入值
    - Remove Index，Remove Item 从数组中删除元素
    - Clear 清空数组
    - Append Array 把另外一个array追加到本数组
    - Random 随机一个元素
* 流程控制
    - Branch 相当于if else
    - Sequence 顺序执行
    - For Loop
        - first index 和last index 都是闭区间
        - Loop Body 每次循环执行的事件
        - Completed 完成事件
    - For each Loop
        - 接收一个Array 作为参数
        - Array Element 当前处理的内容
        - Array index  当前处理的索引
    - While Loop
        - condition 条件  
    - Do N
        - 执行N次
        - 需要在可循环的事件中引入，比如Event Tick
        - Reset 重置条件
        - Exit 每次循环执行的内容
    - Do Once 执行一次
        - Completed 执行的内容
        - Start Closed 指定Reset后才执行
    - Flip Flop 翻牌，执行一次A，执行一次B 然后循环
    - Gate
        - Enter 进入事件
        - Open 打开
        - Close 关闭
        - Toggle 切换
        - Exit 当 Open时执行
        - StartClosed 开启时是否是开启的
    - MultiGate
        - Reset 重置条件
        - In Random 随机选择输出
        - Loop 循环
        - Start Index 开始索引，触发后索引先加1 再查找输出
        - 输出，根据index 选择适当的输出
            - Out 0 
            - Out 1
* 事件
    - EventBeginPlay 游戏开始
    - EventActorBeginOverlap Actor与其他组件碰撞
    - Event Tick 每帧触发一次
    - 键盘事件
    - 鼠标事件
    - 触摸事件
* 自定义事件
    - 自定义事件可以通过其他事件触发，比如键盘事件，调用自定义事件对应的函数
    - 自定义事件可以增加输入
* 自定义函数
    - 通过 function 面板可以创建自定义函数
    - 通过选中一段nodes 可以colapse function 
    - 自定义函数可以增加输入和输出
* 宏
    - 需要手动为宏增加输入和输出，指定参数类型是Exec
* 宏库
    - 右键->blueprints->blueprint macro library
    - 可以在宏库中增加多个宏
* 枚举
    - 枚举包含一系列预定义的集合
    - 自定义枚举
        - 右键->blueprints->enumeration
            - 通过add enumerator 增加枚举项
        - 枚举是全局的
    - Equals（Enum） 判断枚举是否相等
    - Switch on 通过枚举执行不同的逻辑
* HUD 用户可以查看的界面，例如背包
* Actors
    - 场景中存在的物体，拥有位置，旋转，缩放属性
    - 拥有EventTick，每帧刷新
    - 可以被创建和销毁
        - hide 和destroy的区别，前者只是隐藏，不会清理内存
    - 将一个组件转换成蓝图类
        - 蓝图按钮->Convert Selection to Blueprint Class
* Pawn
    - 可以被游戏控制器和AI 控制器控制
    - 可以在场景中移动，拥有位置，旋转，缩放属性
    - 响应鼠标，键盘等输入事件
    
* Character
    - 继承了pawn
    - 垂直布局
    - 具有走跑跳，飞行能力
        -  Components->Character Movement
* Character Controller
    - 没有位置信息
    - 分为玩家控制器和AI控制器
    - 可以接收通知
    - ue默认的控制器只能控制一个角色，如果要控制多个，需要创建自定义控制器
* Component
    - 每个组件有一个root component，这个component 只有Scale，没有location 和 rotate
    - 创建一个空的组件 Scene，一般会用一个空的组件作为root
    - 父组件的Transform变换会影响自组件
* Game Mode
    - Settings -> World Setting -> Game Mode
        - 默认角色 selected game mode-> default pawn class
    - 自定义Game Mode
        - 新建 BluePrintClass，选择基类 Game Mode Base 
    -
* 转换
    - Get World Location 获取世界坐标 会计算场景坐标和相对坐标
    - Get Relative Location 获取相对坐标，相对于parent
    - Get World Rotation 获取世界旋转，会计算场景旋转和相对旋转
    - Get Relative Rotation 获取相对旋转，相对于parent
    - Get World Scale 获取世界倍增，会计算场景倍增和相对倍增
    - Get Relative Scale 获取相对旋转，相对于parent
    - Get World Transform，组合world loaction，rotation，scale
    - Get Relative Transform 组合相对parent location，rotation，scale

    - Set Actor Rotation 设置旋转
    - Set Actor Scale 设置缩放
* 给 Static Mesh 增加碰撞
    - 打开 Static Mesh
    - 选择 colision，选择需要的碰撞形状
* 创建和销毁 actor
    - SpawnActor 动态生成物体
        - 指定class
        - 指定转换
        - SetStaticMesh 设置网格
        - SetMobility 设置可移动
    - DestroyActor 销毁对象
    - Make Array 生成Actor集合
        - 可以通过Add pin 增加多种类型
    - IsValide 检查Actor 是否被销毁
    - Get All Actor of class 获取一个类型的所有对象
    -  静态网格vs 骨骼网格
        - 区别是是否包含骨骼，骨骼为动作准备，一般用maya或者blender 创建骨骼
* 触发器
    - 增加Actor ->Basic->Trigger Box,Trigger Sphere
    - 增加触发器事件
        - 在大纲中选中触发器
        - Add Event for trigger
            - Add on actor begin overlap 进入事件
            - Add on actor end overlap 离开事件
            - add on actor hit 触碰事件，tbd
* Random Float In Range
    - 在一个最大值和最小值区间内随机一个值
* Set Timer By Event
    - Event 要执行的事件（可以关联自定义事件）
    - Time 事件间隔
    - Looping 是否循环
* Clear Timer By Function Name
    - 停止指定事件定时器（自定义事件对应的Function）
* Mesh Tag
    - 增加tag，可以为具体的actor增加tag 也可以为类增加tag
        - detail 面板搜索detail
            - 增加tag
    - Actor has tag 查找指定Tag的Actor
* Sphere Trace by channel 碰撞检测
    - Start 起点
    - End 终点
    - Radius 半径
    - Debug Type 在调试时起辅助作用，比如显示出探测的区域
    - Out Hit Actor 检测到的碰撞物体（如果看不到，就把onhit 分离一下）
* Get Player Character 获取主角
* 蓝图间的沟通
    - Working BP 发送消息
    - Target BP 接收消息
    - 直接通信
        - working BP 定义一个变量，类型是Target Bp 对象的引用
        - 变量要设置instance editable
        - working BP 详细面板选择正确的变量值
    - 通过事件通信
        - 在一个蓝图中定义的事件，在另一个蓝图中可以调用事件函数
    - 蓝图接口
        - BluePrints -> BluePrint Interface
            - 只包含函数
        - 蓝图关联接口
            - Class Settings ->Detail->Interface 增加接口
            - 在WorkingBP 中可以调用接口中的方法，发送信息
            - TargetBP 接收信息要处理 Event Interact With Objects，这个事件会被调用
        - 接口方法可以增加输入和输出
            - 增加了输出以后，接口被转换成一个函数
    - 事件分发
        - WorkingBP 
            - 增加Event Dispatcher
            - 触发EventDispatcher
        - TargetBP
            - 绑定消息，Bind event to Dispatcher，绑定后WorkingBP分发消息后，对应的Event会被调用
                - Event 当消息被分发时调用
                - 分发消息的Character
            - 解绑消息 UnBind event from Dispatcher，解绑后，对应的Event不会被再调用
                - Event 绑定时指定的事件
                - target 分发消息的Character
            - UnBind all event from Dispatcher 一次性解绑所有分发消息
* 创建第一人称角色
    - 创建 Game Mode 继承自 GameModeBase
        - World Setting -> Game Mode 应用
    - Player Start 定义开始时摄像机的朝向
    - 定义角色类，继承自Character
        - Game Mode ->Default Pawn class 设置为定义的角色类
        - 胶囊体
            - capsule half height 胶囊体高度的一半
        - 增加相机component
            - 视角  Filed of view
    - 自定义控制器，继承自 player controller
        -  Game Mode->Player controller Class 应用
        - 每一个玩家拥有一个玩家控制器
    - action mapping vs axis mapping
        - action mapping
            - 键盘事件，常用于一次按键响应的情况
        - axis mapping 
            - 鼠标事件
            - 键盘事件，需要持续按下响应的情况下使用
    - Add controller yaw input 设置yaw 旋转
        - 绕z轴水平旋转
        - 选择顶层组件->detail->Pawn->use controller rotation yaw 要设置为true
    - Add controller pitch input 设置pitch 旋转
        - 绕Y轴，上下旋转
        - 以下选项2选一
            - 选择顶层组件->detail->Pawn->use controller rotation pitch 要设置为true
            - detail ->use pawn control rotation 设置为true （推荐）
    - Add Movement Input 处理移动
        - Scale 使用axis value
        - world direction 移动方向
            - 前后移动可以用Get Forward Vector
            - 左右移动可以用Get Right Vector
    - Character 包含实现好的跳跃和下蹲方法
        - Jump
        - Stop Jumping
        - Crouch
        - UnCrouch
        - 在character movement 的detail部分可以设置详细的参数
            - Character Movement ->Detail ->Movement capability ->Can Croch 设置为true才能跳跃
    - Set Max Walk Speed 设置最大移动速度
        - target 是 Character Movement 组件
    - Set Max Walk Speed Crouched 下蹲时的行走速度
    - Set Velocity 设置速度
    - Get Velocity 获得速度
    - 抓取物体
        - 增加PhysicsHandle 组件
            - Grab Component at Location
                - target 是上面增加的 physics handle 组件
                - Component 是要抓取的组件
                - Grab Location 抓取位置，一般是上面Component 的世界坐标
            - Set Target Location 
                - target 是 PhysicsHandle
            - Wake rigid body 
                - target 是抓取的组件
            - Release Component 放开组件
                - target 是physics handle 组件
            - 被抓取的物体要是可以移动的，并且simulate physics 设置为true
    - 抛掷物体
        - Add impulse（mesh） 增加脉冲
            - Velchange 勾选了以后，输入的impulse 会认为是速度变化
            - target 要抛掷的物体
            - Impulse 抛掷速度，这里可以用前置向量的倍数
            
        - Release Component 放开组件
* Lerp
    - 基于Alpha 从A 状态变到B状态
* Set Vector Parameter Value 
    - 给对象的某个参数赋值
* Create Dynamic Material Instance
    - 创建材质对象
* 自定义曲线
    - Add -> Miscellaneous -> Curve
    - Set Vector Curve 
    - Set Float Curve
    - Set Liner Color Curve

* TimeLine
    - Add Time Line 增加时间线
        - Track 
            - Float_Track
            - Vector_Track
            - Event_Track
            - Clolor_Track
        - Loop
            - Set Loop
        - 设置时长
            - Set Timeline Length
        - 获取时长
            - Get TimeLine Length
        - 获取当前执行位置
            - Get Playback position
        - 设置执行位置
            - Set Playback position
        - Auto Play 自动播放
    
       
        