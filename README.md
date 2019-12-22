# imgix-rails-note
imgix-rails ix_image_tag/url now can't apply rails asset digest hash default.
This repository provides a sample of add digest hash with using view helper to imgix-rails.

## tl;dr
There are 2 ways to provide digest hash w/ imgix-rails helper.

image_url proveide digest hash like follow.
```rb
image_url('machine_motion_capture.png')
=> "http://localhost:5000/assets/machine_motion_capture-6b8ad943af2821ca56772bd2c5f4c7dd36946ef45138c50ee43728429f260208.png"
```

but imgix-rails(4.0.0) ix_image_tag/url provide as follows

```rb
image_url('machine_motion_capture.png')
=> "https://assets.imgix.net/assets/machine_motion_capture.png?ixlib=rails-4.0.0"
```
digest hash dropped down...

let's add digest hash manualy using view helper.
### pattern 1, use asset_path
asset_path returns digest hashed path, so we use it before path pass to ix_image_tag/url.

```rb
ix_image_url(asset_path('machine_motion_capture.png'))
=> "https://assets.imgix.net/assets/machine_motion_capture-6b8ad943af2821ca56772bd2c5f4c7dd36946ef45138c50ee43728429f260208.png?ixlib=rails-4.0.0"
```

### pattern 2, use image_path
image_path also returns digest hashed path.

```rb
ix_image_url(asset_path('machine_motion_capture.png'))
=> "https://assets.imgix.net/assets/machine_motion_capture-6b8ad943af2821ca56772bd2c5f4c7dd36946ef45138c50ee43728429f260208.png?ixlib=rails-4.0.0"
```

## tips
Following custom view helper may help us a lot.

```rb
  def ex_ix_image_url(path, options = {}) 
    ix_image_url(image_path(path), options)
  end

  def ex_ix_image_tag(path, **options)
    ix_image_tag(image_path(path), **options)
  end
```

## example code
We can check minimal example with clone this repository.
1. clone & bundle install
2. setup database
```bash
docker run -d -it --rm -p 27017:27017 mongo:3.6.12 mongod --bind_ip 0.0.0.0
```
3. execute rails (bundle exec rails s)
4. access to http://localhost:3000

If you want to check produciton build check, run command with RAILS_ENV=production.

```bash
RAILS_ENV=production rails assets:precompile
RAILS_ENV=production rails s
```

(note) if you want to remove assets generated by assets:precompile, run [`bundle exec rails assets:clobber`](https://github.com/rails/sprockets-rails/blob/master/README.md#rake-task).
