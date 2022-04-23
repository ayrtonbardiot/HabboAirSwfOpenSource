// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.avatar.generic.BodyView

package com.sulake.habbo.avatar.generic
{
    import com.sulake.habbo.avatar.common.CategoryBaseView;
    import com.sulake.habbo.avatar.common._SafeStr_3396;
    import com.sulake.habbo.avatar.common._SafeStr_3301;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;

    public class BodyView extends CategoryBaseView implements _SafeStr_3396 
    {

        private const TAB_BOY_ID:String = "tab_boy";
        private const TAB_GIRL_ID:String = "tab_girl";

        public function BodyView(_arg_1:_SafeStr_3301)
        {
            super(_arg_1);
            _SafeStr_3887 = "hd";
        }

        override public function reset():void
        {
            super.reset();
            _SafeStr_3887 = "hd";
        }

        override public function init():void
        {
            if (!_window)
            {
                _window = (_SafeStr_4619.controller.view.getCategoryContainer("generic") as _SafeStr_3133);
                _window.visible = false;
                _window.procedure = windowEventProc;
            };
            updateGridView("hd");
            _SafeStr_3883 = true;
            updateGenderTab();
        }

        override public function getWindowContainer():_SafeStr_3133
        {
            if (!_SafeStr_3883)
            {
                init();
            };
            updateGenderTab();
            return (_window);
        }

        public function updateGenderTab():void
        {
            if (_SafeStr_4619 == null)
            {
                return;
            };
            switch (_SafeStr_4619.controller.gender)
            {
                case "M":
                    activateTab("tab_boy");
                    inactivateTab("tab_girl");
                    return;
                case "F":
                    activateTab("tab_girl");
                    inactivateTab("tab_boy");
                    return;
                default:
                    return;
            };
        }

        public function switchCategory(_arg_1:String):void
        {
            updateGenderTab();
            updateGridView(((_arg_1 == "") ? _SafeStr_3887 : _arg_1));
        }

        private function windowEventProc(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                switch (_arg_2.name)
                {
                    case "tab_boy":
                        _SafeStr_4619.controller.gender = "M";
                        _arg_1.stopPropagation();
                        break;
                    case "tab_girl":
                        _SafeStr_4619.controller.gender = "F";
                        _arg_1.stopPropagation();
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
                        case "tab_boy":
                        case "tab_girl":
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
                            case "tab_boy":
                            case "tab_girl":
                                updateGenderTab();
                                return;
                            default:
                                return;
                        };
                    };
                };
            };
        }


    }
}//package com.sulake.habbo.avatar.generic

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3301 = "_-f1d" (String#2199, DoABC#4)
// _SafeStr_3396 = "_-wy" (String#6678, DoABC#4)
// _SafeStr_3883 = "_-w1c" (String#683, DoABC#4)
// _SafeStr_3887 = "_-6N" (String#2449, DoABC#4)
// _SafeStr_4619 = "_-x1i" (String#278, DoABC#4)


