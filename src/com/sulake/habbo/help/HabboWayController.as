// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.help.HabboWayController

package com.sulake.habbo.help
{
    import com.sulake.habbo.window.utils.IModalDialog;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.window.widgets._SafeStr_3275;
    import com.sulake.core.window.components._SafeStr_3199;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;

    public class HabboWayController 
    {

        private const START_PAGE:int = 0;

        private var _SafeStr_7282:int = 0;
        private var _SafeStr_4780:int = 0;
        private var _habboHelp:HabboHelp;
        private var _SafeStr_4003:IModalDialog;
        private var _window:_SafeStr_3133;
        private var _disposed:Boolean = false;

        public function HabboWayController(_arg_1:HabboHelp)
        {
            _habboHelp = _arg_1;
        }

        public function dispose():void
        {
            if (!_disposed)
            {
                closeWindow();
                if (_habboHelp)
                {
                    _habboHelp = null;
                };
                _disposed = true;
            };
        }

        private function get finalPage():int
        {
            return (_habboHelp.getInteger("help.habboway.page.count", 6));
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function showHabboWay():void
        {
            closeWindow();
            _SafeStr_4003 = _habboHelp.getModalXmlWindow("habbo_way");
            _window = _SafeStr_3133(_SafeStr_4003.rootWindow);
            _window.procedure = onWindowEvent;
            _SafeStr_3275(_SafeStr_3199(_window.findChildByName("page_widget")).widget).size = finalPage;
            setCurrentPage(0);
        }

        public function closeWindow():void
        {
            _window = null;
            if (_SafeStr_4003)
            {
                _SafeStr_4003.dispose();
                _SafeStr_4003 = null;
            };
        }

        private function onWindowEvent(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if ((((_disposed) || (!(_window))) || (!(_arg_1.type == "WME_CLICK"))))
            {
                return;
            };
            switch (_arg_2.name)
            {
                case "header_button_close":
                    closeWindow();
                    return;
                case "next_button":
                    setCurrentPage(Math.min(finalPage, (_SafeStr_4780 + 1)));
                    _habboHelp.trackGoogle("habboWay", ("clickNextPage_" + _SafeStr_4780));
                    return;
                case "back_button":
                case "previous_button":
                    setCurrentPage(Math.max(0, (_SafeStr_4780 - 1)));
                    _habboHelp.trackGoogle("habboWay", ("clickPrevPage_" + _SafeStr_4780));
                    return;
                case "quiz_button":
                    _habboHelp.trackGoogle("habboWay", "clickQuiz");
                    _habboHelp.showHabboWayQuiz();
                    return;
            };
        }

        private function setCurrentPage(_arg_1:int):void
        {
            _SafeStr_4780 = _arg_1;
            if (_SafeStr_4780 < finalPage)
            {
                if (_SafeStr_4780 == 0)
                {
                    _window.findChildByName("previous_button").visible = false;
                }
                else
                {
                    _window.findChildByName("previous_button").visible = true;
                };
                IStaticBitmapWrapperWindow(_window.findChildByName("illustration")).assetUri = (("${image.library.url}habboway/page_" + _SafeStr_4780) + ".png");
                IStaticBitmapWrapperWindow(_window.findChildByName("dove_image")).assetUri = "help_habboway_dove_off";
                _SafeStr_3275(_SafeStr_3199(_window.findChildByName("page_widget")).widget).position = (_SafeStr_4780 + 1);
                _window.findChildByName("correct_title").caption = (("${habbo.way.page." + _SafeStr_4780) + ".correct.title}");
                _window.findChildByName("correct_description").caption = (("${habbo.way.page." + _SafeStr_4780) + ".correct.description}");
                _window.findChildByName("wrong_title").caption = (("${habbo.way.page." + _SafeStr_4780) + ".wrong.title}");
                _window.findChildByName("wrong_description").caption = (("${habbo.way.page." + _SafeStr_4780) + ".wrong.description}");
                _window.findChildByName("page_container").visible = true;
                _window.findChildByName("final_page").visible = false;
                _window.findChildByName("page_container").invalidate();
            }
            else
            {
                IStaticBitmapWrapperWindow(_window.findChildByName("illustration")).assetUri = "${image.library.url}habboway/page_end.png";
                IStaticBitmapWrapperWindow(_window.findChildByName("dove_image")).assetUri = "help_habboway_dove_on";
                _SafeStr_3275(_SafeStr_3199(_window.findChildByName("page_widget")).widget).position = 0;
                _window.findChildByName("page_container").visible = false;
                _window.findChildByName("final_page").visible = true;
                _window.findChildByName("final_page").invalidate();
            };
        }


    }
}//package com.sulake.habbo.help

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_3275 = "_-2J" (String#8317, DoABC#4)
// _SafeStr_4003 = "_-Qd" (String#802, DoABC#4)
// _SafeStr_4780 = "_-fK" (String#917, DoABC#4)
// _SafeStr_7282 = "_-D9" (String#39702, DoABC#4)


