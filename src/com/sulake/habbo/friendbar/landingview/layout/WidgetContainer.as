// by nota

//com.sulake.habbo.friendbar.landingview.layout.WidgetContainer

package com.sulake.habbo.friendbar.landingview.layout
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.friendbar.landingview.interfaces.ILandingViewWidget;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.friendbar.landingview.interfaces.ISettingsAwareWidget;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.habbo.friendbar.landingview.interfaces.IResizeAwareWidget;
    import com.sulake.habbo.friendbar.landingview.interfaces._SafeStr_3483;

    public class WidgetContainer implements _SafeStr_13 
    {

        private var _SafeStr_4981:ILandingViewWidget;
        private var _placeholderName:String;
        private var _SafeStr_6899:_SafeStr_3133;
        private var _SafeStr_3853:Boolean;
        private var _SafeStr_6296:CommonWidgetSettings;

        public function WidgetContainer(_arg_1:ILandingViewWidget, _arg_2:String, _arg_3:CommonWidgetSettings, _arg_4:_SafeStr_3133=null)
        {
            _SafeStr_4981 = _arg_1;
            _placeholderName = _arg_2;
            _SafeStr_6296 = _arg_3;
            _SafeStr_6899 = _arg_4;
        }

        public function dispose():void
        {
            if (_SafeStr_4981)
            {
                _SafeStr_4981.dispose();
                _SafeStr_4981 = null;
            };
            if (_SafeStr_6296)
            {
                _SafeStr_6296 = null;
            };
        }

        public function get disposed():Boolean
        {
            return ((_SafeStr_4981 == null) && (_SafeStr_6296 == null));
        }

        public function refresh(_arg_1:_SafeStr_3133):void
        {
            var _local_3:* = null;
            var _local_2:_SafeStr_3133 = _SafeStr_3133(_arg_1.findChildByName("content_background"));
            if (!_SafeStr_3853)
            {
                _SafeStr_3853 = true;
                if (_placeholderName != null)
                {
                    _local_3 = _local_2.getChildByName(_placeholderName);
                    if (_local_3 == null)
                    {
                        return;
                    };
                    _SafeStr_4981.initialize();
                    _local_2.addChildAt(_SafeStr_4981.container, _local_2.getChildIndex(_local_3));
                    _SafeStr_4981.container.x = _local_3.x;
                    _SafeStr_4981.container.y = _local_3.y;
                    _local_2.removeChild(_local_3);
                    _local_3.dispose();
                }
                else
                {
                    if (((!(_SafeStr_6899 == null)) && (!(_SafeStr_4981 == null))))
                    {
                        _SafeStr_4981.initialize();
                        _SafeStr_6899.addChild(_SafeStr_4981.container);
                    }
                    else
                    {
                        return;
                    };
                };
            };
            if (_SafeStr_4981.container != null)
            {
                if (((_SafeStr_4981 is ISettingsAwareWidget) && (!(_SafeStr_6296 == null))))
                {
                    ISettingsAwareWidget(_SafeStr_4981).settings = _SafeStr_6296;
                };
                _SafeStr_4981.refresh();
            };
        }

        public function get container():_SafeStr_3109
        {
            return (_SafeStr_4981.container);
        }

        public function windowResized():void
        {
            if ((((!(_SafeStr_4981 == null)) && (!(_SafeStr_4981.container == null))) && (_SafeStr_4981 is IResizeAwareWidget)))
            {
                IResizeAwareWidget(_SafeStr_4981).windowResized();
            };
        }

        public function disable():void
        {
            if ((((!(_SafeStr_4981 == null)) && (!(_SafeStr_4981.container == null))) && (_SafeStr_4981 is _SafeStr_3483)))
            {
                _SafeStr_3483(_SafeStr_4981).disable();
            };
        }


    }
}//package com.sulake.habbo.friendbar.landingview.layout

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3483 = "_-rr" (String#12168, DoABC#4)
// _SafeStr_3853 = "_-T1w" (String#2104, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_6296 = "_-42" (String#2661, DoABC#4)
// _SafeStr_6899 = "_-D1H" (String#14918, DoABC#4)


