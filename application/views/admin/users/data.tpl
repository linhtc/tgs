{if !empty($list)}
    {foreach from=$list key=i item=item}
        <tr>
            <td>{$item.id}</td>
            <td>{$item.username}</td>
            <td>{$item.full_name}</td>
            <td>{$item.group_name}</td>
            <td>
                {if $item.locked == 0}
                    <span class="label label-success">Đã kích hoạt</span>
                {/if}
                {if $item.locked == 1}
                    <span class="label label-danger">Bị khóa</span>
                {/if}
            </td>
            <td>
                {if (not empty($permission['edit'])) or $permission eq 1}
                    <a href="edit/{$item.id}" onclick="window.location='edit/{$item.id}'" class="label label-info" style="cursor: pointer;">Sửa</a>
                {/if}
                {if (not empty($permission['edit'])) or $permission eq 1}
                    <a href="change_password/{$item.id}" onclick="window.location='change_password/{$item.id}'" class="label label-info" style="cursor: pointer;">Đổi mật khẩu</a>
                {/if}
                {if (not empty($permission['permission'])) or $permission eq 1}
                    <a href="change_permission/{$item.id}" onclick="window.location='change_permission/{$item.id}'" class="label label-info" style="cursor: pointer;">Phân quyền</a>
                {/if}
                {if (not empty($permission['status'])) or $permission eq 1}
                    <a del-id="{$item.id}" del-status="{$item.locked}" class="label label-info a-confirmation" data-toggle="confirmation" style="cursor: pointer;">Đổi trạng thái</a>
                {/if}
            </td>
        </tr>
    {/foreach}
{/if}