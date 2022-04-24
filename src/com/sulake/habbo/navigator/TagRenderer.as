// by nota

//com.sulake.habbo.navigator.TagRenderer

package com.sulake.habbo.navigator
{
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.components._SafeStr_3264;
    import com.sulake.core.window.*;
    import com.sulake.core.window.components.*;
    import com.sulake.core.window.events.*;
    import com.sulake.core.window.enum.*;

    public class TagRenderer 
    {

        private var _navigator:_SafeStr_1697;
        private var _SafeStr_6521:Function;
        private var _SafeStr_6520:Boolean = false;

        public function TagRenderer(_arg_1:_SafeStr_1697, _arg_2:Function=null)
        {
            _navigator = _arg_1;
            _SafeStr_6521 = _arg_2;
        }

        public function dispose():void
        {
            _navigator = null;
            _SafeStr_6521 = null;
        }

        public function set useHashTags(_arg_1:Boolean):void
        {
            _SafeStr_6520 = _arg_1;
        }

        public function refreshTags(_arg_1:_SafeStr_3133, _arg_2:Array):void
        {
            var _local_4:int;
            var _local_3:_SafeStr_3133 = _SafeStr_3133(_arg_1.findChildByName("tags"));
            _local_4 = 0;
            while (_local_4 < 4)
            {
                refreshTag(_local_3, _local_4, _arg_2[_local_4]);
                _local_4++;
            };
            var _local_5:int = (_arg_1.width - _local_3.x);
            Util.layoutChildrenInArea(_local_3, _local_5, 14);
            _local_3.height = Util.getLowestPoint(_local_3);
            _local_3.visible = (_arg_2.length > 0);
        }

        public function refreshTag(_arg_1:_SafeStr_3133, _arg_2:int, _arg_3:String):void
        {
            var _local_4:* = null;
            var _local_5:String = ("tag." + _arg_2);
            var _local_6:_SafeStr_3133 = _SafeStr_3133(_arg_1.getChildByName(_local_5));
            if (((_arg_3 == null) || (_arg_3 == "")))
            {
                if (_local_6 != null)
                {
                    _local_6.visible = false;
                };
            }
            else
            {
                if (_local_6 == null)
                {
                    _local_6 = _SafeStr_3133(_navigator.getXmlWindow("iro_tag"));
                    _local_6.name = _local_5;
                    _arg_1.addChild(_local_6);
                    _local_6.procedure = tagProcedure;
                };
                _local_4 = ITextWindow(_local_6.findChildByName("txt"));
                _local_4.text = (((_SafeStr_6520) ? "#" : "") + _arg_3);
                _local_4.width = (_local_4.textWidth + 5);
                _local_6.width = (_local_4.width + 3);
                refreshTagBg(_local_6, false);
                _local_6.visible = true;
            };
        }

        private function refreshTagBg(_arg_1:_SafeStr_3133, _arg_2:Boolean):void
        {
            refreshBgPiece(_arg_1, "l", _arg_2);
            refreshBgPiece(_arg_1, "m", _arg_2);
            refreshBgPiece(_arg_1, "r", _arg_2);
        }

        private function tagProcedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            var _local_3:* = null;
            var _local_4:* = null;
            var _local_5:_SafeStr_3133 = (_arg_2 as _SafeStr_3133);
            if (_local_5 == null)
            {
                return;
            };
            if (_arg_1.type == "WME_OVER")
            {
                refreshTagBg(_local_5, true);
            }
            else
            {
                if (_arg_1.type == "WME_OUT")
                {
                    refreshTagBg(_local_5, false);
                }
                else
                {
                    if (_arg_1.type == "WME_CLICK")
                    {
                        _local_3 = ITextWindow(_local_5.findChildByName("txt"));
                        _local_4 = ((_SafeStr_6520) ? _local_3.text.substr(1, (_local_3.text.length - 1)) : _local_3.text);
                        _SafeStr_14.log(("TAG CLICKED: " + _local_4));
                        _navigator.performTagSearch(_local_4);
                        if (_SafeStr_6521 != null)
                        {
                            (_SafeStr_6521());
                        };
                    };
                };
            };
        }

        private function refreshBgPiece(_arg_1:_SafeStr_3133, _arg_2:String, _arg_3:Boolean):void
        {
            var _local_4:* = null;
            var _local_5:_SafeStr_3264 = _SafeStr_3264(_arg_1.findChildByName(("bg_" + _arg_2)));
            if (_local_5.tags[0] != ("" + _arg_3))
            {
                _local_5.tags.splice(0, _local_5.tags.length);
                _local_5.tags.push(("" + _arg_3));
                _local_4 = (("tag_" + _arg_2) + ((_arg_3) ? "_reactive" : ""));
                _local_5.bitmap = _navigator.getButtonImage(_local_4);
                _local_5.disposesBitmap = false;
                _local_5.invalidate();
            };
        }


    }
}//package com.sulake.habbo.navigator

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1697 = "_-bu" (String#1958, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_6520 = "_-F1v" (String#15539, DoABC#4)
// _SafeStr_6521 = "_-g1O" (String#11320, DoABC#4)


