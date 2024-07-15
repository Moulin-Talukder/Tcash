<?php

namespace App\Traits;

use Illuminate\Database\Eloquent\Casts\Attribute;

trait GlobalStatus
{
    public static function changeStatus($id, $column = 'Status')
    {
        $modelName = get_class();

        $query     = $modelName::findOrFail($id);
        if ($query->status == 1) {
            $query->status = 0;
        } else {
            $query->status = 1;
        }
        $message       = $column. ' changed successfully';

        $query->save();
        $notify[] = ['success', $message];
        return back()->withNotify($notify);
    }


    public function statusBadge(): Attribute
    {
        return new Attribute(
            get: fn () => $this->badgeData(),
        );
    }

    public function badgeData()
    {
        $html = '';
        if ($this->status == 1) {
            $html = '<span class="badge badge--success">' . trans('Enabled') . '</span>';
        } else {
            $html = '<span><span class="badge badge--warning">' . trans('Disabled') . '</span></span>';
        }
        return $html;
    }

    public function scopeActive($query)
    {
        return $query->where('status', 1);
    }

    public function scopeInactive($query)
    {
        return $query->where('status', 0);
    }
}