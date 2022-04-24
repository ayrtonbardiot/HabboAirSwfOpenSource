// by nota

//com.sulake.habbo.ui.widget.roomchat.RoomChatItem

package com.sulake.habbo.ui.widget.roomchat
{
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.assets.IAssetLibrary;
    import flash.display.BitmapData;
    import com.sulake.habbo.ui.widget.events.RoomWidgetChatUpdateEvent;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components._SafeStr_3264;
    import flash.geom.Rectangle;
    import com.sulake.core.window.components.ILabelWindow;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class RoomChatItem 
    {

        public static const CHAT_ITEM_STACKING_HEIGHT:Number = 18;
        private static const MESSAGE_TEXT_MARGIN_LEFT:int = 6;
        private static const MESSAGE_TEXT_MARGIN_RIGHT:int = 6;
        private static const RESPECT_ICON_MARGIN_RIGHT:int = 35;
        private static const _SafeStr_9078:int = 26;
        private static const NAME:String = "name";
        private static const MESSAGE:String = "message";
        private static const POINTER:String = "pointer";
        private static const BACKGROUND:String = "background";
        private static const TOOLTIP_DRAG_FOR_HISTORY:String = "${chat.history.drag.tooltip}";

        private var _SafeStr_4981:RoomChatWidget;
        private var _windowManager:_SafeStr_1695;
        private var _SafeStr_4020:_SafeStr_18;
        private var _window:IRegionWindow;
        private var _SafeStr_3745:IAssetLibrary;
        private var _SafeStr_3820:String;
        private var _SafeStr_5425:String;
        private var _aboveLevels:int = 0;
        private var _SafeStr_5414:int = -1;
        private var _SafeStr_4129:int;
        private var _SafeStr_5417:int;
        private var _SafeStr_4579:int;
        private var _senderName:String = new String();
        private var _SafeStr_4132:String = new String();
        private var _SafeStr_5422:Array;
        private var _SafeStr_5423:Array;
        private var _SafeStr_5415:int;
        private var _SafeStr_5416:Number;
        private var _SafeStr_5419:BitmapData;
        private var _senderColor:uint;
        private var _SafeStr_3693:int;
        private var _SafeStr_5420:int;
        private var _SafeStr_5421:int;
        private var _SafeStr_5426:int;
        private var _width:Number = 0;
        private var _SafeStr_5418:Boolean = false;
        private var _topOffset:Number = 0;
        private var _originalBackgroundYOffset:Number = 0;
        private var _SafeStr_4050:Number = 0;
        private var _SafeStr_4051:Number = 0;
        private var _SafeStr_5424:Boolean = false;

        public function RoomChatItem(_arg_1:RoomChatWidget, _arg_2:_SafeStr_1695, _arg_3:IAssetLibrary, _arg_4:String, _arg_5:_SafeStr_18, _arg_6:String)
        {
            _SafeStr_4981 = _arg_1;
            _windowManager = _arg_2;
            _SafeStr_3745 = _arg_3;
            _SafeStr_3820 = _arg_4;
            _SafeStr_4020 = _arg_5;
            _SafeStr_5425 = _arg_6;
        }

        public function dispose():void
        {
            if (_window != null)
            {
                _window.dispose();
                _window = null;
                _SafeStr_4981 = null;
                _windowManager = null;
                _SafeStr_4020 = null;
                _SafeStr_5419 = null;
            };
        }

        public function define(_arg_1:RoomWidgetChatUpdateEvent):void
        {
            _SafeStr_4129 = _arg_1.chatType;
            _SafeStr_5417 = _arg_1.styleId;
            _SafeStr_4579 = _arg_1.userId;
            _senderName = _arg_1.userName;
            _SafeStr_5426 = _arg_1.userCategory;
            _SafeStr_4132 = _arg_1.text;
            _SafeStr_5422 = _arg_1.links;
            _SafeStr_5416 = _arg_1.userX;
            _SafeStr_5419 = _arg_1.userImage;
            _senderColor = _arg_1.userColor;
            _SafeStr_3693 = _arg_1.roomId;
            _SafeStr_5420 = _arg_1.userType;
            _SafeStr_5421 = _arg_1.petType;
            renderView();
        }

        public function set message(_arg_1:String):void
        {
            _SafeStr_4132 = _arg_1;
        }

        public function set senderName(_arg_1:String):void
        {
            _senderName = _arg_1;
        }

        public function set senderImage(_arg_1:BitmapData):void
        {
            _SafeStr_5419 = _arg_1;
        }

        public function set senderColor(_arg_1:uint):void
        {
            _senderColor = _arg_1;
        }

        public function set chatType(_arg_1:int):void
        {
            _SafeStr_4129 = _arg_1;
        }

        public function get view():_SafeStr_3133
        {
            return (_window);
        }

        public function get screenLevel():int
        {
            return (_SafeStr_5414);
        }

        public function get timeStamp():int
        {
            return (_SafeStr_5415);
        }

        public function get senderX():Number
        {
            return (_SafeStr_5416);
        }

        public function set senderX(_arg_1:Number):void
        {
            _SafeStr_5416 = _arg_1;
        }

        public function get width():Number
        {
            return (_width);
        }

        public function get height():Number
        {
            return (18);
        }

        public function get message():String
        {
            return (_SafeStr_4132);
        }

        public function get x():Number
        {
            return (_SafeStr_4050);
        }

        public function get y():Number
        {
            return (_SafeStr_4051);
        }

        public function get aboveLevels():int
        {
            return (_aboveLevels);
        }

        public function set aboveLevels(_arg_1:int):void
        {
            _aboveLevels = _arg_1;
        }

        public function set screenLevel(_arg_1:int):void
        {
            _SafeStr_5414 = _arg_1;
        }

        public function set timeStamp(_arg_1:int):void
        {
            _SafeStr_5415 = _arg_1;
        }

        public function set x(_arg_1:Number):void
        {
            _SafeStr_4050 = _arg_1;
            if (_window != null)
            {
                _window.x = _arg_1;
            };
        }

        public function set y(_arg_1:Number):void
        {
            _SafeStr_4051 = _arg_1;
            if (_window != null)
            {
                _window.y = ((_arg_1 - _topOffset) + _originalBackgroundYOffset);
            };
        }

        public function hidePointer():void
        {
            var _local_1:* = null;
            if (_window)
            {
                _local_1 = _window.findChildByName("pointer");
                if (_local_1)
                {
                    _local_1.visible = false;
                };
            };
        }

        public function setPointerOffset(_arg_1:Number):void
        {
            if (((!(_window)) || (_window.disposed)))
            {
                return;
            };
            var _local_3:_SafeStr_3264 = (_window.findChildByName("pointer") as _SafeStr_3264);
            var _local_2:_SafeStr_3264 = (_window.findChildByName("middle") as _SafeStr_3264);
            if (((_local_2 == null) || (_local_3 == null)))
            {
                return;
            };
            _local_3.visible = true;
            _arg_1 = (_arg_1 + (_window.width / 2));
            _arg_1 = Math.min(_arg_1, (_local_2.rectangle.right - _local_3.width));
            _arg_1 = Math.max(_arg_1, _local_2.rectangle.left);
            _local_3.x = _arg_1;
        }

        public function checkOverlap(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:Number):Boolean
        {
            var _local_6:Rectangle = new Rectangle(_SafeStr_4050, _SafeStr_4051, width, _arg_1);
            var _local_7:Rectangle = new Rectangle(_arg_2, _arg_3, _arg_4, _arg_5);
            return (_local_6.intersects(_local_7));
        }

        public function hideView():void
        {
            if (_window)
            {
                _window.dispose();
            };
            _window = null;
            _SafeStr_5418 = false;
        }

        private function get isNotify():Boolean
        {
            return (_SafeStr_5417 == 1);
        }

        public function renderView():void
        {
            var _local_15:* = null;
            var _local_14:int;
            var _local_12:int;
            var _local_16:int;
            var _local_4:int;
            var _local_7:int;
            var _local_17:* = null;
            var _local_18:* = null;
            var _local_2:int;
            var _local_20:* = null;
            var _local_10:* = null;
            if (_SafeStr_5418)
            {
                return;
            };
            _SafeStr_5418 = true;
            if (_window)
            {
                return;
            };
            _window = RoomChatWidget.chatBubbleFactory.getBubbleWindow(_SafeStr_5417, _SafeStr_4129);
            if (!_window)
            {
                return;
            };
            _window.toolTipIsDynamic = true;
            var _local_9:_SafeStr_3264 = (_window.findChildByName("background") as _SafeStr_3264);
            var _local_13:ILabelWindow = (_window.findChildByName("name") as ILabelWindow);
            var _local_5:ITextWindow = (_window.findChildByName("message") as ITextWindow);
            var _local_3:_SafeStr_3264 = (_window.findChildByName("pointer") as _SafeStr_3264);
            var _local_1:Number = _window.height;
            var _local_19:BitmapData = RoomChatWidget.chatBubbleFactory.getPointerBitmapData(_SafeStr_5417);
            _originalBackgroundYOffset = _local_9.y;
            var _local_8:int = ((_local_5.x <= 26) ? 0 : (_local_5.x - 26));
            if (_SafeStr_5419 != null)
            {
                _topOffset = Math.max(0, ((_SafeStr_5419.height - _local_9.height) / 2));
                _local_1 = Math.max(_local_1, _SafeStr_5419.height);
                _local_1 = Math.max(_local_1, _local_9.height);
            };
            _width = 0;
            _window.x = _SafeStr_4050;
            _window.y = _SafeStr_4051;
            _window.width = 0;
            _window.height = _local_1;
            enableDragTooltip();
            addEventListeners(_window);
            if (((_SafeStr_5419) && (!(isNotify))))
            {
                _local_15 = (_window.findChildByName("user_image") as _SafeStr_3264);
                if (_local_15)
                {
                    _local_15.width = _SafeStr_5419.width;
                    _local_15.height = _SafeStr_5419.height;
                    _local_15.bitmap = _SafeStr_5419;
                    _local_15.disposesBitmap = false;
                    _local_14 = int((_local_15.x - (_SafeStr_5419.width / 2)));
                    _local_12 = int(Math.max(0, ((_local_9.height - _SafeStr_5419.height) / 2)));
                    if (_SafeStr_5420 == 2)
                    {
                        if (_SafeStr_5421 == 15)
                        {
                            if (_SafeStr_5419.height > _local_9.height)
                            {
                                _local_12 = int(((_SafeStr_5419.height - _local_9.height) / 2));
                            };
                        };
                    };
                    _local_15.x = _local_14;
                    _local_15.y = (_local_15.y + _local_12);
                    _width = (_width + (_local_15.x + _SafeStr_5419.width));
                };
            };
            if (_local_13 != null)
            {
                if (!isNotify)
                {
                    _local_13.text = (_senderName + ": ");
                    _local_13.y = (_local_13.y + _topOffset);
                    _local_13.width = (_local_13.textWidth + 6);
                }
                else
                {
                    _local_13.text = "";
                    _local_13.width = 0;
                };
                _width = (_width + _local_13.width);
            };
            if (_SafeStr_4129 == 3)
            {
                _local_5.text = _SafeStr_4020.registerParameter("widgets.chatbubble.respect", "username", _senderName);
                _width = 35;
            }
            else
            {
                if (_SafeStr_4129 == 4)
                {
                    _local_5.text = _SafeStr_4020.registerParameter("widget.chatbubble.petrespect", "petname", _senderName);
                    _width = 35;
                }
                else
                {
                    if (_SafeStr_4129 == 6)
                    {
                        _local_5.text = _SafeStr_4020.registerParameter("widget.chatbubble.pettreat", "petname", _senderName);
                        _width = 35;
                    }
                    else
                    {
                        if (_SafeStr_4129 == 7)
                        {
                            _local_5.text = message;
                            _width = 35;
                        }
                        else
                        {
                            if (_SafeStr_4129 == 8)
                            {
                                _local_5.text = message;
                                _width = 35;
                            }
                            else
                            {
                                if (_SafeStr_4129 == 9)
                                {
                                    _local_5.text = message;
                                    _width = 35;
                                }
                                else
                                {
                                    if (_SafeStr_4129 == 5)
                                    {
                                        _local_5.text = message;
                                        _width = 35;
                                    }
                                    else
                                    {
                                        if (_SafeStr_5422 == null)
                                        {
                                            _local_5.text = message;
                                        }
                                        else
                                        {
                                            _SafeStr_5423 = [];
                                            _local_7 = -1;
                                            _local_4 = 0;
                                            while (_local_4 < _SafeStr_5422.length)
                                            {
                                                _local_17 = _SafeStr_5422[_local_4][1];
                                                _local_18 = (("{" + _local_4) + "}");
                                                _local_2 = _SafeStr_4132.indexOf(_local_18);
                                                _local_7 = (_local_2 + _local_17.length);
                                                _SafeStr_5423.push([_local_2, _local_7]);
                                                _SafeStr_4132 = _SafeStr_4132.replace(_local_18, _local_17);
                                                _local_4++;
                                            };
                                            _local_5.text = message;
                                            _local_5.immediateClickMode = true;
                                            _local_5.setParamFlag(16, false);
                                            _local_5.setParamFlag(0x40000000, true);
                                            _local_20 = _local_5.getTextFormat();
                                            switch (_SafeStr_5417)
                                            {
                                                case 2:
                                                    _local_20.color = 0xDDDDDD;
                                                    break;
                                                default:
                                                    _local_20.color = 2710438;
                                            };
                                            _local_20.underline = true;
                                            _local_4 = 0;
                                            while (_local_4 < _SafeStr_5423.length)
                                            {
                                                _local_10 = _SafeStr_5423[_local_4];
                                                try
                                                {
                                                    _local_5.setTextFormat(_local_20, _local_10[0], _local_10[1]);
                                                }
                                                catch(e:RangeError)
                                                {
                                                    _SafeStr_14.log("Chat message links were malformed. Could not set TextFormat");
                                                };
                                                _local_4++;
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            };
            if (_local_5.visible)
            {
                _local_5.x = (_width + _local_8);
                if (_local_13 != null)
                {
                    _local_5.x = (_local_13.x + _local_13.width);
                    if (_local_13.width > 6)
                    {
                        _local_5.x = (_local_5.x - (6 - 1));
                    };
                };
                _local_5.y = (_local_5.y + _topOffset);
                _local_16 = _local_5.textWidth;
                _local_5.width = (_local_16 + 6);
                _width = (_width + _local_5.width);
            };
            if (((!(_local_3 == null)) && (_local_3.visible)))
            {
                _local_3.bitmap = _local_19;
                _local_3.disposesBitmap = false;
                _local_3.x = (_width / 2);
                _local_3.y = (_local_3.y + _topOffset);
            };
            var _local_6:int = _local_5.width;
            if (_local_13)
            {
                _local_6 = (_local_6 + _local_13.width);
            };
            var _local_11:BitmapData = RoomChatWidget.chatBubbleFactory.buildBubbleImage(_SafeStr_5417, _SafeStr_4129, _local_6, _local_9.height, _senderColor);
            _window.width = _local_11.width;
            _window.y = (_window.y - _topOffset);
            _window.y = (_window.y + _originalBackgroundYOffset);
            _width = _window.width;
            _local_9.bitmap = _local_11;
            _local_9.y = _topOffset;
        }

        public function enableDragTooltip():void
        {
            _SafeStr_5424 = true;
            refreshTooltip();
        }

        public function disableDragTooltip():void
        {
            _SafeStr_5424 = false;
            refreshTooltip();
        }

        private function refreshTooltip():void
        {
            if (_window == null)
            {
                return;
            };
            _window.toolTipCaption = "";
            if (_SafeStr_4981.isGameSession)
            {
                return;
            };
            if (_SafeStr_5424)
            {
                _window.toolTipCaption = "${chat.history.drag.tooltip}";
            };
            _window.toolTipDelay = 500;
        }

        private function addEventListeners(_arg_1:_SafeStr_3133):void
        {
            _arg_1.setParamFlag(1, true);
            _arg_1.addEventListener("WME_CLICK", onBubbleMouseClick);
            _arg_1.addEventListener("WME_DOWN", onBubbleMouseDown);
            _arg_1.addEventListener("WME_OVER", onBubbleMouseOver);
            _arg_1.addEventListener("WME_OUT", onBubbleMouseOut);
            _arg_1.addEventListener("WME_UP", onBubbleMouseUp);
        }

        private function testMessageLinkMouseClick(_arg_1:int, _arg_2:int):Boolean
        {
            var _local_3:int;
            var _local_4:ITextWindow = (_window.getChildByName("message") as ITextWindow);
            var _local_5:int = _local_4.getCharIndexAtPoint((_arg_1 - _local_4.x), (_arg_2 - _local_4.y));
            if (_local_5 > -1)
            {
                _local_3 = 0;
                while (_local_3 < _SafeStr_5423.length)
                {
                    if (((_local_5 >= _SafeStr_5423[_local_3][0]) && (_local_5 <= _SafeStr_5423[_local_3][1])))
                    {
                        if (_SafeStr_5422[_local_3][2] == 0)
                        {
                            HabboWebTools.openExternalLinkWarning(_SafeStr_5422[_local_3][0]);
                        }
                        else
                        {
                            if (_SafeStr_5422[_local_3][2] == 1)
                            {
                                HabboWebTools.openWebPage((_SafeStr_5425 + _SafeStr_5422[_local_3][0]), "habboMain");
                            }
                            else
                            {
                                HabboWebTools.openWebPage((_SafeStr_5425 + _SafeStr_5422[_local_3][0]));
                            };
                        };
                        return (true);
                    };
                    _local_3++;
                };
            };
            return (false);
        }

        private function onBubbleMouseClick(_arg_1:WindowMouseEvent):void
        {
            if (((_SafeStr_5422) && (_SafeStr_5422.length > 0)))
            {
                if (testMessageLinkMouseClick(_arg_1.localX, _arg_1.localY))
                {
                    return;
                };
            };
            _SafeStr_4981.onItemMouseClick(_SafeStr_4579, _senderName, _SafeStr_5426, _SafeStr_3693, _arg_1);
        }

        private function onBubbleMouseDown(_arg_1:WindowMouseEvent):void
        {
            _SafeStr_4981.onItemMouseDown(_SafeStr_4579, _SafeStr_5426, _SafeStr_3693, _arg_1);
        }

        private function onBubbleMouseOver(_arg_1:WindowMouseEvent):void
        {
            _SafeStr_4981.onItemMouseOver(_SafeStr_4579, _SafeStr_5426, _SafeStr_3693, _arg_1);
        }

        private function onBubbleMouseOut(_arg_1:WindowMouseEvent):void
        {
            _SafeStr_4981.onItemMouseOut(_SafeStr_4579, _SafeStr_5426, _SafeStr_3693, _arg_1);
        }

        private function onBubbleMouseUp(_arg_1:WindowMouseEvent):void
        {
            _SafeStr_4981.mouseUp();
        }

        public function get chatStyle():int
        {
            return (_SafeStr_5417);
        }

        public function get originalBackgroundYOffset():Number
        {
            return (_originalBackgroundYOffset);
        }


    }
}//package com.sulake.habbo.ui.widget.roomchat

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_3693 = "_-KI" (String#730, DoABC#4)
// _SafeStr_3745 = "_-4b" (String#920, DoABC#4)
// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)
// _SafeStr_4020 = "_-el" (String#1659, DoABC#4)
// _SafeStr_4050 = "_-22N" (String#402, DoABC#4)
// _SafeStr_4051 = "_-1L" (String#429, DoABC#4)
// _SafeStr_4129 = "_-c1k" (String#2784, DoABC#4)
// _SafeStr_4132 = "_-s1S" (String#1283, DoABC#4)
// _SafeStr_4579 = "_-021" (String#3552, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_5414 = "_-W1z" (String#17727, DoABC#4)
// _SafeStr_5415 = "_-f15" (String#4009, DoABC#4)
// _SafeStr_5416 = "_-81z" (String#12216, DoABC#4)
// _SafeStr_5417 = "_-32K" (String#8440, DoABC#4)
// _SafeStr_5418 = "_-vl" (String#11732, DoABC#4)
// _SafeStr_5419 = "_-S1D" (String#4075, DoABC#4)
// _SafeStr_5420 = "_-S13" (String#2704, DoABC#4)
// _SafeStr_5421 = "_-fl" (String#6414, DoABC#4)
// _SafeStr_5422 = "_-Cm" (String#5679, DoABC#4)
// _SafeStr_5423 = "_-N3" (String#7917, DoABC#4)
// _SafeStr_5424 = "_-WH" (String#12100, DoABC#4)
// _SafeStr_5425 = "_-Z1" (String#14754, DoABC#4)
// _SafeStr_5426 = "_-Y1g" (String#10281, DoABC#4)
// _SafeStr_9078 = "_-217" (String#33971, DoABC#4)


