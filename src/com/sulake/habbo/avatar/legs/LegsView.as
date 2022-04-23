// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.avatar.legs.LegsView

package com.sulake.habbo.avatar.legs
{
    import com.sulake.habbo.avatar.common.CategoryBaseView;
    import com.sulake.habbo.avatar.common._SafeStr_3396;
    import com.sulake.habbo.avatar.common._SafeStr_3301;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;

    public class LegsView extends CategoryBaseView implements _SafeStr_3396 
    {

        public function LegsView(_arg_1:_SafeStr_3301)
        {
            super(_arg_1);
        }

        override public function init():void
        {
            if (!_window)
            {
                _window = (_SafeStr_4619.controller.view.getCategoryContainer("legs") as _SafeStr_3133);
                _window.visible = false;
                _window.procedure = windowEventProc;
            };
            _SafeStr_3883 = true;
            if (((_SafeStr_4619) && (_SafeStr_3887 == "")))
            {
                _SafeStr_4619.switchCategory("lg");
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
            _arg_1 = ((_arg_1 == "") ? _SafeStr_3887 : _arg_1);
            inactivateTab(_currentTabName);
            switch (_arg_1)
            {
                case "lg":
                    _currentTabName = "tab_pants";
                    break;
                case "sh":
                    _currentTabName = "tab_shoes";
                    break;
                case "wa":
                    _currentTabName = "tab_belts";
                    break;
                default:
                    throw (new Error((('[LegsView] Unknown item category: "' + _arg_1) + '"')));
            };
            _SafeStr_3887 = _arg_1;
            activateTab(_currentTabName);
            if (!_SafeStr_3883)
            {
                init();
            };
            updateGridView(_SafeStr_3887);
        }

        private function windowEventProc(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                switch (_arg_2.name)
                {
                    case "tab_pants":
                        switchCategory("lg");
                        break;
                    case "tab_shoes":
                        switchCategory("sh");
                        break;
                    case "tab_belts":
                        switchCategory("wa");
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
                        case "tab_pants":
                        case "tab_shoes":
                        case "tab_belts":
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
                            case "tab_pants":
                            case "tab_shoes":
                            case "tab_belts":
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
}//package com.sulake.habbo.avatar.legs

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3301 = "_-f1d" (String#2199, DoABC#4)
// _SafeStr_3396 = "_-wy" (String#6678, DoABC#4)
// _SafeStr_3883 = "_-w1c" (String#683, DoABC#4)
// _SafeStr_3887 = "_-6N" (String#2449, DoABC#4)
// _SafeStr_4619 = "_-x1i" (String#278, DoABC#4)


