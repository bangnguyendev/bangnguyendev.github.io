---
layout: post
title: Test markdown
meta-title: "Test markdown"
subtitle: Each post also has a subtitle
bigimg:
  - "/img/My_Picture/anh_3nguoi_dalat.webp" : "Da Lat City"
image: /img/2020-01-06-test-markdown/markdown_html.jpg
tags: [markdown, text, html, yaml]
# comments: true
category: Social sciences
---

You can write regular [markdown](http://markdowntutorial.com/) here and Jekyll will automatically convert it to a nice webpage.  I strongly encourage you to [take 5 minutes to learn how to write in markdown](http://markdowntutorial.com/) - it'll teach you how to transform regular text into bold/ italics/ headings/ tables/ etc.

**Here is some bold text**

## Here is a secondary heading

Here's a useless table:

| Number | Next number | Previous number |
| :------ |:--- | :--- |
| Five | Six | Four |
| Ten | Eleven | Nine |
| Seven | Eight | Six |
| Two | Three | One |


How about a yummy crepe?

![Crepe](https://s3-media3.fl.yelpcdn.com/bphoto/cQ1Yoa75m2yUFFbY2xwuqw/348s.jpg)

It can also be centered!

![Crepe](https://s3-media3.fl.yelpcdn.com/bphoto/cQ1Yoa75m2yUFFbY2xwuqw/348s.jpg){: .center-block :}

Here's a code chunk:

~~~
var foo = function(x) {
  return(x + 5);
}
foo(3)
~~~

And here is the same code with syntax highlighting:

```javascript
var foo = function(x) {
  return(x + 5);
}
foo(3)
```

## Boxes
You can add notification, warning and error boxes like this:

### Notification

{: .box-note}
**Note:** This is a notification box.

### Warning

{: .box-warning}
**Warning:** This is a warning box.

### Error

{: .box-error}
**Error:** This is an error box.

### thumbnail ảnh

<link rel="stylesheet" href="/Topic/ARGB-LED/assets/js/styles.css">
<div class="image-gallery">
   <div class="image-item">
      <img src="/Topic/ARGB-LED/image/3D_box_PCB1_2024-06-16.png" alt="Image 1" onclick="openModal(this.src)">
   </div>
   <div class="image-item">
      <img src="/Topic/ARGB-LED/image/3D_PCB1_mat-truoc.png" alt="Image 2" onclick="openModal(this.src)">
   </div>
   <div class="image-item">
      <img src="/Topic/ARGB-LED/image/3D_PCB1_mat-sau.png" alt="Image 3" onclick="openModal(this.src)">
   </div>
   <div class="image-item">
      <img src="/Topic/ARGB-LED/image/3D_PCB1.png" alt="Image 4" onclick="openModal(this.src)">
   </div>
</div>

<!-- Modal to display full-size image -->
<div id="imageModal" class="modal" onclick="closeModal()">
   <span class="close">&times;</span>
   <img class="modal-content" id="modalImage">
</div>

<script>
   function openModal(src) {
      document.getElementById('imageModal').style.display = "block";
      document.getElementById('modalImage').src = src;
   }

   function closeModal() {
      document.getElementById('imageModal').style.display = "none";
   }
</script>