User.find_each do |user|
  if !user.avatar?
    if user.gender == 0
      url = AvatarUploader.default_url("boy")
    else
      url = AvatarUploader.default_url("girl")
    end
  user.remote_avatar_url = url;
  user.save;
  end
end




.ui.container
  %div.ui.two.column.mobile.reversed.centered.stackable.grid
    %div.fifteen.wide.column
      .cover.ui.segment{style: "background-image: url('#{@user.cover.thumb.url.to_s}'); background-repeat: no-repeat;  background-size: cover; background-position: center"}
        - if current_user == @user
          %div.ui.mini.orange.right.floated.pointing.floating.dropdown.icon.button
            %i.setting.icon
            %div.menu
              = link_to "Edit Profile", edit_user_registration_path, class: "item"
          #editcover.ui.mini.icon.right.floated.button
            %i.pencil.icon
        %div.ui.two.column.mobile.reversed.stackable.grid
          %div.sixteen.wide.column.dp
            #editavatar.dp.ui.segment{style: "background-image: url('#{@user.avatar.thumb.url.to_s}'); background-repeat: no-repeat;  background-size: cover; background-position: top"}
      -# .ui.horizontal.divider
  %div.ui.three.column.mobile.centered.stackable.grid
    %div.two.wide.column
      .ui.horizontal.divider
        .ui.header
          = @user.username
    -# %div.three.wide.column
    -#   .ui.right.floated.header
    -#     = @user.username
    %div.eight.wide.column
      .userstates
        = render "shared/userstates", user: @user

    -# %div.four.wide.column
    -#   .ui.centered.card
    -#     .content
    -#       .header
    -#         = @user.username
    -#       .meta
    -#         = @user.profession_list.reverse.join("-")
    -#       .description
    -#         = @user.location
    -#       .ui.horizontal.divider
    -#         #follow{id:"#{@user.id}"}
    -#           = render "follows/form", user: @user
    -#       .userstates
    -#         = render "shared/userstates", user: @user
    -#   -# = render "shared/userinfotile", user: @user
.ui.divider
= react_component('Pins', {data: @pinsdata})

- if current_user == @user
  .ui.small.coverpic.modal
    .header
      Edit Cover Picture
    .image.content
      .ui.medium.image
        %img{:src => "#{@user.cover}", :id => "img_cover_prev"}/
      .description
        %br
        .ui.header Please upload image file
        .actions
          = simple_form_for(@user, as: :user, url: registration_path(@user), html: { method: :put }) do |f|
            = f.input :cover, class:"ui button", label: false
            = f.button :submit, value: "Save", class: "ui basic disabled button", id: "co_submit"
            .ui.black.deny.button
              Cancel

- if current_user == @user
  .ui.small.avatar.modal
    .header
      Edit Avatar
    .image.content
      .ui.medium.circular.image
        %img{:src => "#{@user.avatar_url}", :id => "img_avatar_prev"}/
      .description
        %br
        .ui.header Please upload image file
        .actions
          = simple_form_for(@user, as: :user, url: registration_path(@user), html: { method: :put }) do |f|
            = f.input :avatar, class:"ui button", label: false
            = f.button :submit, value: "Save", class: "ui basic disabled button", id: "av_submit"
            .ui.black.deny.button
              Cancel
