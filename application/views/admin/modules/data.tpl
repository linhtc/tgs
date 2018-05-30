{if !empty($list)}
    {foreach from=$list key=i item=item}
        <tr>
            <td>{$item.id}</td>
            <td>{$item.module_key}</td>
            <td>
                {assign var=permissions value=$item.functions|json_decode:1}
                {foreach from=$permissions key=ii item=ip}
                    <span class="label label-default">{$ip}</span>
                {/foreach}
            </td>
            <td>
                {if (not empty($permission['edit'])) or $permission eq 1}
                    <a href="edit/{$item.id}" onclick="window.location='edit/{$item.id}'" class="label label-info" style="cursor: pointer;">Sửa</a>
                {/if}
                {if (not empty($permission['delete'])) or $permission eq 1}
                    <a info-id="{$item.id}" info-action="delete" class="label label-danger a-confirmation" data-toggle="confirmation" style="cursor: pointer;">Xóa</a>
                {/if}
            </td>
        </tr>
    {/foreach}
{/if}