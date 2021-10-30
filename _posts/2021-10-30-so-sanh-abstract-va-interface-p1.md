---
layout: post
title: "Abstract class và Interface C# - P1"
meta-title: "Abstract class và Interface C# - P1"
subtitle: "... Sự khác nhau và cách sử dụng "
bigimg:
  - "/img/2021-10-30-so-sanh-abstract-va-interface/cover-csharp.jpg"
image: "/img/2021-10-30-so-sanh-abstract-va-interface/avatarr-csharp.png"
tags: [Abstract, Interface, override, Abstract method, virtual method]
# gh-repo: bangnguyendev/Documents
# gh-badge: [star, watch, fork, follow]
# comments: true
---
### Abstract Class và Interface C#? Đâu là sự lựa chọn? 
**`1. ĐIỂM GIỐNG NHAU GIỮA ABSTRACT CLASS VÀ INTERFACE C#`**

Nói về abstract (trừu tượng) ảo thì chúng ta đều biết Abstract class, Virtual method và Interface.

Ở mục so sánh này chúng ta sẽ so sánh ngang cấp class: 

{: .box-warning}
Abstract class và Interface.

Giống: 
-   Abstract class và interface đều không thể khởi tạo đối tượng bên trong được.
-   Abstract class và interface đều có thể khai báo các phương thức nhưng không thực hiện chúng.
-   Abstract class và interface đều bao gồm các phương thức abstract.
-   Abstract class và interface đều được thực thi từ các class con hay còn gọi kế thừa, dẫn xuất.
-   Abstract class và interface đều có thể kế thừa từ nhiều interface.

**`2. ĐIỂM KHÁC NHAU GIỮA ABSTRACT CLASS VÀ INTERFACE C#`**

| Abstract Class | Interface |
| :--- |:--- |
| Cho phép khai báo field | Không cho phép |
| Các phương thức có thể có thân hàm hoặc không có thân hàm. | Chỉ khai báo không có thân hàm |
| Class dẫn xuất chỉ kế thừa được từ 1 abstract class và nhiều interface. | Class triển khai có thể triển khai nhiều interface. |
| Có chứa constructor | Không có |
| Các phương thức có từ khóa access modifier | Không có |

--------------------------------------------

### Abstract class chính quy và ví dụ mô phỏng
 
`Abstract class` là một class chứa các phương thức ảo, nó được `sinh ra để các class khác kế thừa`.
 
**Ví dụ:**
 
Ta cần lập trình tạo dữ liệu của các loại động vật nói chung (chó, mèo, cá, gà, ...).
 
Thì **thuộc tính chung** của chúng nó là **tên loại động vật** (chó, mèo,..), **thuộc tính có chân**, **tiếng kêu** ...
 
Thay vì mỗi con vật ta phải khởi tạo mỗi class riêng thì ta sẽ tạo một class có thuộc tính loài chung có tên Animal.

<div class="post-img-post">
    <img src="/img/2021-10-30-so-sanh-abstract-va-interface/mindmap_Animal.png">
</div>

{% highlight c# linenos %}
abstract class Animal
{
    abstract public void NameAnimal(string name);
    abstract public void SoChan(int sochan);

    public void TiengKeu()
    {
        Console.WriteLine("Con nào cũng kêu.");
    }
}
{% endhighlight %}

Ta tạo ra một class dành riêng cho `loại chó` (miễn là chó và có rất nhiều loại chó sẽ khởi tạo từ class này).

Nó là loại chó và được kế thừa từ class Animal, vì nó có thuộc tính của class Animal.

{% highlight c# linenos %}
class ConCho : Animal
{
    public override void NameAnimal(string name)
    {
        Console.WriteLine("Đây là con {0} nhé.", name);
    }

    public override void SoChan(int sochan)
    {
        Console.WriteLine("Số chân của nó là {0}", sochan);
    }

}
{% endhighlight %}

Tương tự `loại chó` thì ta cũng tạo ra một class dành cho loại gà ( và cũng có rất nhiều loại gà) và dĩ nhiên nó sẽ kế thừa thuộc tính của Animal.

{% highlight c# linenos %}
class ConGa: Animal
{
    public override void NameAnimal(string name)
    {
        Console.WriteLine("Đây là con {0} nhé.", name);
    }

    public override void SoChan(int sochan)
    {
        Console.WriteLine("Số chân của nó là {0}", sochan);
    }

}
{% endhighlight %}

Và mỗi khi sử dụng thì ta lại khởi tạo đối tượng thôi. 

Ah, tới đây thì các bạn sẽ nói: 

{: .box-warning}
"Ủa đơn giản thôi! Thì chỉ cần tạo riêng mỗi loại một class là xong mà?"

Ối bạn ới.....

Đúng là nếu đơn giản vậy thì chỉ cần tạo class con chó, class con gà mỗi thứ một class là xong.

Những thứ chúng ta cần ứng dụng là một cái gì đó to lớn hơn, vào các Project lớn.

Và khi một Project lớn, cái chúng ta cần khi lập trình, cũng như người khác kế thừa lại code của chúng ta là cái nhìn `trực quan và dễ hiểu hơn.`

Bạn tưởng tượng bạn tạo hàng trăm, hàng ngàn đối tượng, mỗi đối tượng một tên, khi nhìn lại chúng ta khó có thể hình dung đối tượng này có kiểu dữ liệu như thế nào?

Nhưng khi áp dụng `Abstract class` nó sẽ có thêm phần gọi phía trước khởi tạo (ví dụ vậy đó) giúp ta dễ hình dung hơn.

Bây giờ chúng ta nhìn vào chương trình chính nhé.

{% highlight c# linenos %}
class Program
{
    static void Main(string[] args)
    {
        Animal choden = new ConCho();
        choden.NameAnimal("chó đen");
        choden.SoChan(4);       
        choden.TiengKeu();

        Console.WriteLine();

        Animal chotrang = new ConCho();
        chotrang.NameAnimal("chó trắng");
        chotrang.SoChan(4);
        chotrang.TiengKeu();

        Console.WriteLine();

        Animal gaden = new ConGa();
        gaden.NameAnimal("gà đen");
        gaden.SoChan(2);
        gaden.TiengKeu();

        Console.WriteLine();

        Animal gatrang = new ConGa();
        gatrang.NameAnimal("gà trắng");
        gatrang.SoChan(2);
        gatrang.TiengKeu();
    }
}
{% endhighlight %}

Ta thấy, trước khi khởi tạo đối tượng thì sẽ thấy đối tượng có kiểu Animal (động vật), được khởi tạo cho loài chó ( loài gà).

Nhìn rất trực quan, dễ hiểu code.

*Kết quả chương trình:*
```
Đây là con chó đen nhé.
Số chân của nó là 4
Con nào cũng kêu.

Đây là con chó trắng nhé.
Số chân của nó là 4
Con nào cũng kêu.

Đây là con gà đen nhé.
Số chân của nó là 2
Con nào cũng kêu.

Đây là con gà trắng nhé.
Số chân của nó là 2
Con nào cũng kêu.
Press any key to continue . . .
```

Tuy nhiên, ở method tiếng kêu thì cả 4 lần gọi nó hiện ra chung chung.
 
{: .box-warning}
Con nào cũng kêu.
 
Giải pháp ở đây là `Virtual method` bên trong `Abstract class`. Chúng ta sẽ chỉnh lại code của Class Animal như sau:
 
Thêm từ khóa `virtual` vào *method TiengKeu()*.
 
{% highlight c# linenos %}
abstract class Animal
{
    abstract public void NameAnimal(string name);
    abstract public void SoChan(int sochan);
 
    public virtual void TiengKeu()
    {
        Console.WriteLine("Con nào cũng kêu.");
    }
}
{% endhighlight %}

Từ khóa `virtual` cho phép chúng ta `sử dụng lại` method của lớp cha (Animal), hoặc là `override` (ghi đè) lại method mới ở class con (con chó, con gà).

Như *class ConCho* chúng ta đã `override` method **TiengKeu()** của lớp Animal bằng tiếng kêu riêng của loài chó.

{% highlight c# linenos %}
class ConCho : Animal
{
    public override void NameAnimal(string name)
    {
        Console.WriteLine("Đây là con {0} nhé.", name);
    }

    public override void SoChan(int sochan)
    {
        Console.WriteLine("Số chân của nó là {0}", sochan);
    }
    public override void TiengKeu()
    {
        Console.WriteLine("Con chó kêu: Woof..Woof.. ");
    }
}
{% endhighlight %}


*Kết quả chương trình:*
```
Đây là con chó đen nhé.
Số chân của nó là 4
Con chó kêu: Woof..Woof..

Đây là con chó trắng nhé.
Số chân của nó là 4
Con chó kêu: Woof..Woof..

Đây là con gà đen nhé.
Số chân của nó là 2
Con nào cũng kêu.

Đây là con gà trắng nhé.
Số chân của nó là 2
Con nào cũng kêu.
Press any key to continue . . .
```

Vậy là *method TiengKeu()* của *class ConCho* sau khi được `override` lên lớp cha nó đã có tiếng kêu riêng.

{: .box-warning}
Con chó kêu: Woof..Woof..

Bây giờ chúng ta qua *Class ConGa*, như đã nói ở trên khi *method TiengKeu()* của *class Animal* là thuộc tính `virtual`, thì các lớp kế thừa nó `có thể sử dụng lại` hoặc `có thể ghi đè mới`.
Ở kết quả trên, do chúng ta không tiến hành `override` cho *method TiengKeu()* của *class ConGa* nên nó vẫn sử dụng phương thức gọi của lớp cha "Con nào cũng kêu."

Bây giờ, chúng ta chỉnh code một tí. 

Vừa sử dụng lại *method TiengKeu()* của class cha Animal và thêm `override` (ghi đè) thêm thuộc tính mới cho *method TiengKeu()* ở class con kế thừa là *class ConGa*.

{% highlight c# linenos %}
class ConGa: Animal
{
    public override void NameAnimal(string name)
    {
        Console.WriteLine("Đây là con {0} nhé.", name);
    }

    public override void SoChan(int sochan)
    {
        Console.WriteLine("Số chân của nó là {0}", sochan);
    }
    public override void TiengKeu()
    {
        base.TiengKeu();
        Console.WriteLine("Con gà kêu: ò ó o... ");
    }
}
{% endhighlight %}

*Và kết quả chương trình:*
```
Đây là con chó đen nhé.
Số chân của nó là 4
Con chó kêu: Woof..Woof..

Đây là con chó trắng nhé.
Số chân của nó là 4
Con chó kêu: Woof..Woof..

Đây là con gà đen nhé.
Số chân của nó là 2
Con nào cũng kêu.
Con gà kêu: ò ó o...

Đây là con gà trắng nhé.
Số chân của nó là 2
Con nào cũng kêu.
Con gà kêu: ò ó o...
Press any key to continue . . .
```

Chúng ta thấy từ khóa `base`, nó là từ khóa để cho phép gọi lại method của lớp cha class Animal.

Và kết quả là vừa in ra thuộc tính của class cha và in ra thuộc tính của lớp kế thừa.

{: .box-warning}
Con nào cũng kêu.
Con gà kêu: ò ó o...

--------------------------------------------------

### Một số lưu ý với Abstract class:

{: .box-error}
Không thể tạo đối tượng cho Abstract class (nó sinh ra là để class khác kế thừa).

{: .box-error}
Một Abstract class phải có tối thiểu một Abstract method.

{: .box-error}
Một Abstract method không thể có nội dung bên trong (có thể có phần khai báo như ví dụ method *abstract public void NameAnimal(string name);*).

{: .box-error}
Một Abstract method **khi người dùng kế thừa** bắt buộc phải khai báo, hiện thực lại hoàn toàn.

{: .box-warning}
Một Virtual method **khi người dùng kế thừa** có thể sử dụng lại hoặc override mới.

{: .box-error}
Một Abstract method chỉ tồn tại bên trong Abstract class.

{: .box-warning}
Một Virtual method tồn tại trong class thường hoặc Abstract class.

*	[Phần 2: Tìm hiểu về Interface.](/2021-10-30-so-sanh-abstract-va-interface-p2 "Phần 2: Tìm hiểu về Interface")
