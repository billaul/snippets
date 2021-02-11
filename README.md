# Ruby Snippets
### Enumerable    
#### [#with_info](https://github.com/billaul/snippets/blob/main/enumerable.rb)
Usefull for debuging purpose and big task progress visibility

```ruby
1.upto(666).each.with_info(:annoying_loop) {|e| sleep 0.1}
```
