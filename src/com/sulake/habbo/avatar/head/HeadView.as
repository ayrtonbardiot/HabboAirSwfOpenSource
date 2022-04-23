// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.avatar.head.HeadView

package com.sulake.habbo.avatar.head
{
    import com.sulake.habbo.avatar.common.CategoryBaseView;
    import com.sulake.habbo.avatar.common._SafeStr_3396;
    import com.sulake.habbo.avatar.common._SafeStr_3301;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;

    public class HeadView extends CategoryBaseView implements _SafeStr_3396 
    {

        public function HeadView(_arg_1:_SafeStr_3301)
        {
            super(_arg_1);
        }

        override public function init():void
        {
            if (!_window)
            {
                _window = (_SafeStr_4619.controller.view.getCategoryContainer("head") as _SafeStr_3133);
                _window.visible = false;
                _window.procedure = windowEventProc;
            };
            _SafeStr_3883 = true;
            if (((_SafeStr_4619) && (_SafeStr_3887 == "")))
            {
                _SafeStr_4619.switchCategory("hr");
            };
        }

        public function switchCategory(_arg_1:String):void
        {
            if (_window == null)
            {
                return;
            };
            if (_window.disposed)
            {
                return;
            };
            inactivateTab(_currentTabName);
            _arg_1 = ((_arg_1 == "") ? _SafeStr_3887 : _arg_1);
            switch (_arg_1)
            {
                case "hr":
                    _currentTabName = "tab_hair";
                    break;
                case "ha":
                    _currentTabName = "tab_hat";
                    break;
                case "he":
                    _currentTabName = "tab_accessories";
                    break;
                case "ea":
                    _currentTabName = "tab_eyewear";
                    break;
                case "fa":
                    _currentTabName = "tab_masks";
                    break;
                default:
                    throw (new Error((('[HeadView] Unknown item category: "' + _arg_1) + '"')));
            };
            _SafeStr_3887 = _arg_1;
            activateTab(_currentTabName);
            if (!_SafeStr_3883)
            {
                init();
            };
            updateGridView(_arg_1);
        }

        private function windowEventProc(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                switch (_arg_2.name)
                {
                    case "tab_hair":
                        switchCategory("hr");
                        break;
                    case "tab_hat":
                        switchCategory("ha");
                        break;
                    case "tab_accessories":
                        switchCategory("he");
                        break;
                    case "tab_eyewear":
                        switchCategory("ea");
                        break;
                    case "tab_masks":
                        switchCategory("fa");
                        break;
                    default:
                };
            }
            else
            {
                if (_arg_1.type == "WME_OVER")
                {
                    switch (_arg_2.name)
                    {
                        case "tab_hair":
                        case "tab_hat":
                        case "tab_accessories":
                        case "tab_eyewear":
                        case "tab_masks":
                            activateTab(_arg_2.name);
                            break;
                        default:
                    };
                }
                else
                {
                    if (_arg_1.type == "WME_OUT")
                    {
                        switch (_arg_2.name)
                        {
                            case "tab_hair":
                            case "tab_hat":
                            case "tab_accessories":
                            case "tab_eyewear":
                            case "tab_masks":
                                if (_currentTabName != _arg_2.name)
                                {
                                    inactivateTab(_arg_2.name);
                                };
                                return;
                            default:
                                return;
                        };
                    };
                };
            };
        }


    }
}//package com.sulake.habbo.avatar.head

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3301 = "_-f1d" (String#2199, DoABC#4)
// _SafeStr_3396 = "_-wy" (String#6678, DoABC#4)
// _SafeStr_3883 = "_-w1c" (String#683, DoABC#4)
// _SafeStr_3887 = "_-6N" (String#2449, DoABC#4)
// _SafeStr_4619 = "_-x1i" (String#278, DoABC#4)


