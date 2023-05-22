* 打开内存面板
    - 调试->窗口->memory
* go to assembly 查看汇编码，查看每一行对应的汇编码]

### vs 项目设置
- 项目输出路径和中间文件输出路径
    - output directory
        - $(SolutionDir)\bin\$(Platform)\$(Configration)\
    - intermidiate directory
        - $(SolutionDir)\bin\intermidiate\$(Platform)\$(Configration)\
### 指针
    - 指针就是一个整数，保存了一个内存地址
    - 在同一行声明多个指针要在每个参数前加*，否则只对第一个参数生效
### 引用
    - 引用是指针的扩展
    - 引用不占用内存
    - 引用必须在声明时赋值，并且之后不能改变引用的对象

### static
    * 类外
        - 连接阶段，只在本文件内查找变量或者函数定义
    * 类内
        - 类的所有对象共享静态变量
        - 静态变量必须在类外定义，定义时不需要带static关键字
        - 静态变量或静态函数可以通过类或者对象访问
        - 静态方法不能访问非静态变量
            - 因为静态方法没有默认的对象引用参数
    * 函数内
        - 变量的生命周期是整个程序执行期间
        - 变量的作用域是函数内
        - 变量被定义一次，但可以被访问多次
### 枚举
    * 枚举默认占用4字节，定义时使枚举继承自unsigned char 可以缩短占用的内存，占用1字节
    * 枚举可以定义在类作用域内

### 类
    * class 和struct 的区别
        - 默认访问限制不同，class 默认是private，struct 默认是public
    * 构造函数
        - 需要手动初始化类的成员变量，访问未初始化的成员会报编译错误
        - 默认构造函数并不会主动初始化成员
        - 将构造函数设置成private 或者delete 可以避免构造函数被调用以创建对象，尤其是默认构造函数
        - 初始化列表
            - 成员按照声明的顺序初始化，跟初始化列表的顺序无关，如果顺序不一致某些编译器会告警 
            - 必须使用初始化列表初始化成员，如果在构造函数体内初始化，会执行一次默认构造，然后再执行一次赋值操作，浪费性能
        - 隐式类型转换
            - 只有一个参数的构造函数(不包括默认参数)
            - 如果类有一个构造函数接收另一个类型的参数，这个类型的值可以被隐式转换成该类对应的类型
                - A* pa = 12
            - 但是隐式类型转换只接受一次转换
                - 比如有一个构造函数接收一个const std::string& 类型的参数
                - 如果我们传递一个字符串字面量，这个字符串字面量需要首先转换成字符串，然后再由字符串转换成对应类的对象，这是不允许的
        - explict 关键字禁用隐式类型转换
            - 推荐使用 explict ，大部分隐式类型转换，不是你想要的
    * 拷贝构造函数
        - 声明
            - 和构造函数类似，包含一个自身类型的const 引用参数
        - 调用时机
            - 声明对象时直接复制 Entity B= A
            - 值参数传递
            - 值参数返回
        - 没有特殊原因，总是用const 引用传参，避免拷贝
    * 析构函数
        - delete 同一个非NULL或者非 nullptr指针两次会崩溃
    * 虚函数
        - 非虚函数，通过类型查找要访问的函数
        - 虚函数通过基类指针或者引用访问子类函数
        - 基类函数声明virtual，子类函数可选声明override
        - 虚函数的代价
            - 虚函数表，及指向虚函数表的指针，占用内存
            - 访问时要先查找虚函数表，再调用函数
    * 接口
        - 包含纯虚函数 virtual int FuncName() = 0;
        - 接口不能被实例化,子类如果想要实例化，必须实现纯虚函数
    * 访问控制符
        - 默认private
        - private
            - 只有类内可以读写成员，类外和子类不可以访问    
        - protected
            - 类内和子类可以读写成员
    * 空的类也要占用1个byte
    * 生命周期
        - 栈上对象超出作用域被析构
        - 堆上对象要主动调用delete ，delete[]进行析构
    * this
        - 在成员函数中访问，代表指向当前对象的指针
            - 在非const 函数中表示 *const，this不能指向其他对象
            - 在const 函数中表示 const * const， this不能指向其他对象，也不能改变内容
        - 解引用
            - 在非const 函数中返回类型的引用
            - 在const 函数中返回类型的const 引用
*  打印内存布局
    - 将0 地址设置为vector3 类型的初始地址
    - 获取成员的地址
    - 转换成可打印的地址（这里的类型不一定是int* ，但是如果是char* ，第一个参数的起始地址是0 会报错）
    ```C++
        class Vector3
        {
        public:
            float x,y,z;
        };

        int main(int argc, const char * argv[]) {
            int* offsetX = (int*)(&((Vector3*)0)->x);
            int* offsetY = (int*)(&((Vector3*)0)->y);
            int* offsetZ = (int*)(&((Vector3*)0)->z);
            std::cout<<offsetX<<","<<offsetY<<","<<offsetZ<<std::endl;
            return 0;
        }
    ```
* 智能指针
    - 命名空间 memory
    - unique_ptr
        - 不能拷贝
    - shared_ptr
        - 可以共享
    -weak_ptr
        - 从shared ptr 赋值后不增加引用计数
* 运算符重栽
    - http://c.biancheng.net/cplus/operator/
    - 重载->
        ```C++
            Entity* operator -> ()
            {
                return m_Obj;
            }
            const Entity* operator -> () const
            {
                return m_Obj;
            }
        ```
    - 重载输入输出
        ```
        ostream& operator << (ostream& os,const Entity& e)
        {
            std::cout<<e.GetName();
            return ostream;
        }
        istream& operator >> (istream& is,Entity& e)
        {
            std::cin>>e.m_Name;
            return is;
        }
        ```
        - 输入输出在类外定义，如果要访问私有成员要定义成frind函数

* new
    - new的三种形式
        - new operator
            - new是一个操作符
                - 分配空间
                - 调用构造函数
                - 返回指针
        - operator new
            - void* operator new (std::size_t size) throw (std::bad_alloc);  
            - void* operator new (std::size_t size, const std::nothrow_t& nothrow_constant) throw(); 
            - 可以被重栽，申请内存空间，不调用构造函数
            - 如果没有重栽，默认调用全局的operator new
        - placement new
            - A* p=new (ptr)A
            - 在指定空间上创建对象
* 获取数组大小
    - C类型的数组
        - 定义栈上的数组a
        - sizeof（a） 返回整个数占用的空间
        - sizeof（a）/ sizeof（int）返回元素数量
        - 数组大小必须在编译时就已知
    - std::array<type,size>,通过size方法访问大小
* 输出汇编代码
    - AllConfiguration->C/C++ -> Output Files ->Assembler output ->Assembly with source code(/FAs)
* 字符串
    - C类型字符串以0判断结尾，C 原生方法要注意中间包含0 会被截断的情况
    - 字符串字面量保存在只读区域
        - C++11以后不允许直接修改字面量的内容，即便没有主动声明是const，但是vs允许，其他编译器不一定允许
    - 定义 wchar_t 字面量，前面要追加L
    - 字符串字面量前加R忽略转义字符  R"(xxxxyyyxxx)"
* const
    - 指针
        - * 之前的const表示指针所指的内容不能被改变
        - * 之后的const 表示指针本身不能被改变
    - 类
        - 函数声明成const 表示函数不能修改类的任何成员
            - 声明成mutable 的成员可以被修改
        - const 方法只能被const 对象访问
* mutable 
    - 用于可以在const 方法中修改的参数
    - 用于lambda表达式中，按值传递参数时修改值的内容，声明lambda 是mutable
* stl
    - vector
        ```C++
            #include <iostream>
            #include <string>
            #include <vector>

            class Vector3
            {
            public:
                float x,y,z;
                friend std::ostream& operator <<(std::ostream& os, const Vector3& v);
            };

            std::ostream& operator <<(std::ostream& os, const Vector3& v)
            {
                std::cout<<v.x<<","<<v.y<<","<<v.z<<std::endl;
                return os;
            }

            int main(int argc, const char * argv[]) {
                // create
                std::vector<Vector3> vv;
                //insert
                vv.push_back({1.1f,1.2f,1.3f});
                vv.push_back({2.1f,2.2f,2.3f});
                vv.push_back({3.1f,3.2f,3.3f});
                //iterator
                for(unsigned int i=0;i<vv.size();i++)
                {
                    std::cout<<vv[i];
                }
                //iterator2
                for(const Vector3& v : vv )
                {
                    std::cout<<v;
                }
                // delete item
                vv.erase(vv.begin()+1);
                // delete all
                vv.clear();
                return 0;
            }
        ```
    - vector 使用性能优化
    ```
        #include <iostream>
        #include <string>
        #include <vector>

        class Vector3
        {
        public:
            Vector3(float px,float py,float pz)
            : x(px),y(py),z(pz)
            {}
            
            Vector3(const Vector3& v)
            : x(v.x),y(v.y),z(v.z)
            {
                std::cout<<"copy called."<<std::endl;
            }
            float x,y,z;
            friend std::ostream& operator <<(std::ostream& os, const Vector3& v);
        };

        std::ostream& operator <<(std::ostream& os, const Vector3& v)
        {
            std::cout<<v.x<<","<<v.y<<","<<v.z<<std::endl;
            return os;
        }

        int main(int argc, const char * argv[]) {
            // create
            std::vector<Vector3> vv;
            // 优化1 预估大小，避免重新分配
            vv.reserve(3);
            
            //insert
            //vv.push_back(Vector3(1.1f,1.2f,1.3f));
            //vv.push_back(Vector3(2.1f,2.2f,2.3f));
            //vv.push_back(Vector3(3.1f,3.2f,3.3f));
            
            //优化2 使用 emplace_back 替换 push_back
            vv.emplace_back(1.1f,1.2f,1.3f);
            vv.emplace_back(2.1f,2.2f,2.3f);
            vv.emplace_back(3.1f,3.2f,3.3f);
            return 0;
        }

    ```
* std::array 和std::vector的区别
    - array 在栈上构建
        - array 要指定大小不能自动扩展
    - vector 在堆上构建
        - 可以自动扩展大小
* 多返回值的情况推荐使用自定义struct
    - 还可以使用tuple，不限类型
    - vector，同类型
    - array，同类型
    - 引用参数

* 使用外部库
    - 头文件
        - C/C++ ->General ->Additional include directories
    - 静态连接
        - Linker
            - General ->  Additional libraries directories
            - input ->Additional Dependencies  加入静态连接lib文件
    - 动态连接
        - Linker
            - General ->  Additional libraries directories
            - input ->Additional Dependencies 加入动态连接lib文件
        - DLL 文件拷贝到与可执行文件同目录下
* 创建并使用静态连接库
    - 创建静态库项目
        - General -> Configuration Type  选择static library
    - 主项目添加头文件设置
    - 主项目 右键 -> Add -> References，添加静态库项目连接
        - 如果静态库改动，主项目编译时会编译静态连接库
* vscode 编译运行c++配置 launch & task 配置
```json
        {
            "name": "run clang++",
            "type": "cppdbg",
            "request": "launch",
            "program": "${fileDirname}/${fileBasenameNoExtension}",
            "args": [],
            "stopAtEntry": false,
            "cwd": "${fileDirname}",
            "environment": [],
            "externalConsole": false,
            "MIMode": "lldb",
            "preLaunchTask": "C/C++: clang++ make target"
        }
```
``` json
{
            "type": "cppbuild",
            "label": "C/C++: clang++ make target",
            "command": "/usr/bin/clang++",
            "args": [
                "-fcolor-diagnostics",
                "-fansi-escape-codes",
                "-std=c++20",
                "-g",
                "${file}",
                "-o",
                "${fileDirname}/${fileBasenameNoExtension}"
            ],
            "options": {
                "cwd": "${fileDirname}"
            },
            "problemMatcher": [
                "$gcc"
            ],
            "group": {
                "kind": "build",
                "isDefault": true
            },
            "detail": "调试器生成的任务。"
        }
```
    

