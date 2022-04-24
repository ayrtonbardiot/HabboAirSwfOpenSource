// by nota

//com.sulake.habbo.ui.widget.uihelpbubbles.UiHelpBubble

package com.sulake.habbo.ui.widget.uihelpbubbles
{
    import com.sulake.core.window._SafeStr_3133;
    import flash.geom.Point;
    import com.sulake.core.window.components._SafeStr_3332;
    import com.sulake.core.window.components._SafeStr_3122;
    import com.sulake.core.window.components._SafeStr_3264;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import flash.display.BitmapData;
    import flash.geom.Rectangle;
    import com.sulake.core.window.components.ITextFieldWindow;

    public class UiHelpBubble 
    {

        private var _window:_SafeStr_3133;
        private var _SafeStr_4981:UiHelpBubblesWidget;
        private var _SafeStr_3820:String;
        private var _SafeStr_6071:Point;
        private var _SafeStr_6069:String;
        private var _SafeStr_6070:Boolean;
        private var _bubble:_SafeStr_3332;
        private var _nextButton:_SafeStr_3122;
        private var _SafeStr_5302:_SafeStr_3133;
        private var _SafeStr_6067:Boolean;
        private var _SafeStr_6068:_SafeStr_3264;
        private var _SafeStr_6066:_SafeStr_3109;
        private var _SafeStr_6072:_SafeStr_3109;
        private var _SafeStr_4293:Function;

        public function UiHelpBubble(_arg_1:UiHelpBubblesWidget, _arg_2:HelpBubbleItem, _arg_3:Boolean)
        {
            _SafeStr_4981 = _arg_1;
            _SafeStr_3820 = _arg_2.name;
            _SafeStr_6069 = _arg_2.text;
            _SafeStr_6070 = _arg_3;
            _SafeStr_6067 = _arg_2.modal;
            createWindow();
        }

        public function dispose():void
        {
            _SafeStr_4981 = null;
            if (((!(_SafeStr_6066 == null)) && (!(_SafeStr_4293 == null))))
            {
                _SafeStr_6066.removeEventListener("WME_CLICK", _SafeStr_4293);
            };
            if (_SafeStr_5302)
            {
                _SafeStr_5302.dispose();
                _SafeStr_5302 = null;
            };
            if (_window)
            {
                _window.dispose();
                _window = null;
            };
        }

        private function addMouseClickListener(_arg_1:_SafeStr_3109, _arg_2:Function):void
        {
            if (_arg_1 != null)
            {
                _arg_1.setParamFlag(1, true);
                _arg_1.addEventListener("WME_CLICK", _arg_2);
            };
        }

        private function createWindow():void
        {
            var _local_4:* = null;
            var _local_1:int;
            if ((((!(_SafeStr_4981)) || (!(_SafeStr_4981.assets))) || (!(_SafeStr_4981.windowManager))))
            {
                return;
            };
            if (_SafeStr_6067)
            {
                _local_4 = (_SafeStr_4981.assets.getAssetByName("ui_help_modal") as XmlAsset);
                _SafeStr_5302 = (_SafeStr_4981.windowManager.buildFromXML((_local_4.content as XML), 3) as _SafeStr_3133);
            };
            if (_SafeStr_5302)
            {
                _SafeStr_5302.width = _SafeStr_5302.desktop.width;
                _SafeStr_5302.height = _SafeStr_5302.desktop.height;
                _SafeStr_6068 = (_SafeStr_5302.findChildByName("bitmap") as _SafeStr_3264);
                addMouseClickListener(_SafeStr_6068, onActivateBubble);
            };
            var _local_2:XmlAsset = (_SafeStr_4981.assets.getAssetByName("ui_help_bubble") as XmlAsset);
            if (!_local_2)
            {
                return;
            };
            _window = (_SafeStr_4981.windowManager.buildFromXML((_local_2.content as XML), 3) as _SafeStr_3133);
            if (!_window)
            {
                return;
            };
            _nextButton = (_window.findChildByName("help_bubble_btn_ok") as _SafeStr_3122);
            _bubble = (_window.findChildByName("bubble") as _SafeStr_3332);
            var _local_3:ITextWindow = (_window.findChildByName("help_bubble_text") as ITextWindow);
            if (_local_3)
            {
                _local_3.text = _SafeStr_6069;
                _local_1 = _local_3.textHeight;
                _window.height = (_local_1 + 90);
                _nextButton.y = (_local_1 + 30);
            };
            if (!_SafeStr_6070)
            {
                _nextButton.caption = _SafeStr_4981.localizations.getLocalization("alert.close.button", "alert.close.button");
                addMouseClickListener(_nextButton, onLastBubble);
            }
            else
            {
                addMouseClickListener(_nextButton, onNext);
            };
            _window.visible = true;
        }

        public function show():void
        {
            if (_window != null)
            {
                _window.visible = true;
                _window.activate();
            };
        }

        private function onActivateBubble(_arg_1:WindowMouseEvent):void
        {
            _SafeStr_5302.deactivate();
            _window.activate();
        }

        private function onNext(_arg_1:WindowMouseEvent):void
        {
            if (!_SafeStr_4981)
            {
                return;
            };
            if (_SafeStr_5302)
            {
                _SafeStr_5302.visible = false;
            };
            _SafeStr_4981.removeHelpBubble(_SafeStr_3820);
        }

        private function onLastBubble(_arg_1:WindowMouseEvent):void
        {
            if (!_SafeStr_4981)
            {
                return;
            };
            _SafeStr_4981.sendScriptProceedMessage();
            if (_SafeStr_5302)
            {
                _SafeStr_5302.visible = false;
            };
            _SafeStr_4981.removeHelpBubble(_SafeStr_3820);
        }

        public function setModal(_arg_1:Rectangle):void
        {
            if (!_SafeStr_6068)
            {
                return;
            };
            var _local_3:BitmapData = new BitmapData(_SafeStr_5302.width, _SafeStr_5302.height, true, 0xFFE00000);
            var _local_2:BitmapData = new BitmapData(_arg_1.width, _arg_1.height, true, 0xFFFFFF);
            _local_3.copyPixels(_local_2, _local_2.rect, new Point(_arg_1.x, _arg_1.y));
            _SafeStr_6068.bitmap = _local_3;
            _SafeStr_6068.invalidate();
        }

        public function setPosition(_arg_1:Point):void
        {
            _SafeStr_6071 = _arg_1;
            _window.y = _SafeStr_6071.y;
            _window.x = (_SafeStr_6071.x - (_window.width / 2));
        }

        public function setArrowPos(_arg_1:String, _arg_2:int):void
        {
            _bubble.direction = _arg_1;
            _bubble.pointerOffset = (_arg_2 - 8);
        }

        public function setCallback(_arg_1:_SafeStr_3109):void
        {
            if (_SafeStr_4293 != null)
            {
                return;
            };
            _SafeStr_6066 = _arg_1;
            if (!_SafeStr_6070)
            {
                _SafeStr_4293 = onLastBubble;
            }
            else
            {
                _SafeStr_4293 = onNext;
            };
            _SafeStr_6066.addEventListener("WME_CLICK", _SafeStr_4293);
        }

        public function setChatFieldCallback(_arg_1:ITextFieldWindow):void
        {
            if (_SafeStr_4293 != null)
            {
                return;
            };
            _SafeStr_6072 = _arg_1;
            if (!_SafeStr_6070)
            {
                _SafeStr_4293 = onLastBubble;
            }
            else
            {
                _SafeStr_4293 = onNext;
            };
            _SafeStr_6072.addEventListener("WME_CLICK", _SafeStr_4293);
        }

        public function getWindow():_SafeStr_3133
        {
            return (_window);
        }

        public function getName():String
        {
            return (_SafeStr_3820);
        }


    }
}//package com.sulake.habbo.ui.widget.uihelpbubbles

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3122 = "_-i1L" (String#666, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_3332 = "_-s1R" (String#3135, DoABC#4)
// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)
// _SafeStr_4293 = "_-Fn" (String#4092, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_5302 = "_-H8" (String#1949, DoABC#4)
// _SafeStr_6066 = "_-44" (String#13664, DoABC#4)
// _SafeStr_6067 = "_-oU" (String#18134, DoABC#4)
// _SafeStr_6068 = "_-611" (String#11239, DoABC#4)
// _SafeStr_6069 = "_-K1W" (String#22492, DoABC#4)
// _SafeStr_6070 = "_-v1O" (String#12997, DoABC#4)
// _SafeStr_6071 = "_-f1V" (String#14422, DoABC#4)
// _SafeStr_6072 = "_-55" (String#22185, DoABC#4)


