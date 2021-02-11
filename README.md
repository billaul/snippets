# Ruby Snippets
## Enumerable
#### [#with_info](https://github.com/billaul/snippets/blob/main/enumerable.rb#L5)
Usefull for debuging purpose and big task progress visibility

```ruby
1.upto(666).each.with_info(:annoying_loop) {|e| sleep 0.1}
#> annoying_loop    1.50%  11/666 1.0s (eta: 1m5.81s)
```
