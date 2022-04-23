// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.friendbar.landingview.widget.elements._SafeStr_3511

package com.sulake.habbo.friendbar.landingview.widget.elements
{
    import com.sulake.habbo.friendbar.landingview.interfaces.elements.IElementHandler;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.habbo.friendbar.landingview.widget.GenericWidget;

    public class _SafeStr_3511 implements IElementHandler 
    {


        public function initialize(_arg_1:HabboLandingView, _arg_2:_SafeStr_3109, _arg_3:Array, _arg_4:GenericWidget):void
        {
            var _local_5:IStaticBitmapWrapperWindow = IStaticBitmapWrapperWindow(_arg_2);
            var _local_6:String = ("${image.library.url}" + _arg_3[1]);
            _local_5.assetUri = _local_6;
            _local_5.x = _arg_3[2];
        }

        public function refresh():void
        {
        }


    }
}//package com.sulake.habbo.friendbar.landingview.widget.elements

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3511 = "_-n1Y" (String#14136, DoABC#4)


