// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.avatar.common.TabUtils

package com.sulake.habbo.avatar.common
{
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;

    public class TabUtils 
    {


        public static function setElementImage(_arg_1:IStaticBitmapWrapperWindow, _arg_2:Boolean):void
        {
            var _local_3:String = _arg_1.assetUri.replace("_on", "");
            _arg_1.assetUri = ((_arg_2) ? _local_3 : (_local_3 + "_on"));
        }


    }
}//package com.sulake.habbo.avatar.common

