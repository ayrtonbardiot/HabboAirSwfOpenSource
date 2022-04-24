// by nota

//com.sulake.habbo.freeflowchat.viewer.visualization.PooledChatBubble

package com.sulake.habbo.freeflowchat.viewer.visualization
{
    import flash.display.Sprite;
    import com.sulake.habbo.freeflowchat.HabboFreeFlowChat;
    import com.sulake.habbo.freeflowchat.data.ChatItem;
    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import flash.text.TextField;
    import com.sulake.habbo.freeflowchat.viewer.visualization.style._SafeStr_3335;
    import com.sulake.habbo.freeflowchat.viewer.enum.ChatBubbleWidth;
    import flash.geom.Rectangle;
    import flash.geom.Point;
    import flash.events.TextEvent;
    import flash.display.DisplayObject;
    import flash.events.Event;
    import flash.events.MouseEvent;

    public class PooledChatBubble extends Sprite 
    {

        public static const MAX_WIDTH_DEFAULT:uint = 300;

        private const DESKTOP_MARGIN_LEFT:int = 85;
        private const DESKTOP_MARGIN_RIGHT:int = 190;
        private const LINEAR_INTERPOLATION_MS:uint = 150;
        private const MAX_HEIGHT:uint = 108;
        private const _SafeStr_8541:int = 28;
        private const POINTER_MARGIN_RIGHT:int = 15;
        private const POINTER_REPOSITION_INTERVAL_MS:int = 2000;

        private var _SafeStr_4147:HabboFreeFlowChat;
        private var _SafeStr_4534:ChatItem;
        private var _background:Sprite;
        private var _SafeStr_4532:Bitmap;
        private var _SafeStr_4536:Bitmap;
        private var _SafeStr_4535:BitmapData;
        private var _SafeStr_4533:TextField;
        private var _style:_SafeStr_3335;
        private var _SafeStr_4540:uint = 0;
        private var _SafeStr_4541:uint;
        private var _SafeStr_4538:int;
        private var _SafeStr_4539:int;
        private var _SafeStr_4542:int;
        private var _SafeStr_4544:int;
        private var _SafeStr_4543:Number;
        private var _SafeStr_4545:Number;
        private var _SafeStr_4550:Boolean = false;
        private var _SafeStr_4549:int = 0;
        private var _SafeStr_4547:int;
        private var _SafeStr_4548:Boolean = false;
        private var _hasHitDesktopMargin:Boolean = false;
        private var _SafeStr_4537:Sprite;
        private var _SafeStr_4546:uint = 0;
        private var _SafeStr_4551:int = -1;

        public function PooledChatBubble(_arg_1:HabboFreeFlowChat)
        {
            _SafeStr_4147 = _arg_1;
            _SafeStr_4532 = new Bitmap();
            _SafeStr_4536 = new Bitmap();
            _SafeStr_4533 = new TextField();
            _SafeStr_4537 = new Sprite();
            this.addEventListener("addedToStage", onAddedToStage);
            this.addEventListener("removedFromStage", onRemovedFromStage);
        }

        public function set chatItem(_arg_1:ChatItem):void
        {
            _SafeStr_4534 = _arg_1;
        }

        public function set face(_arg_1:BitmapData):void
        {
            _SafeStr_4535 = _arg_1;
        }

        public function set style(_arg_1:_SafeStr_3335):void
        {
            _style = _arg_1;
        }

        public function recreate(_arg_1:String, _arg_2:uint, _arg_3:Boolean=false, _arg_4:int=-1):void
        {
            var _local_10:int;
            var _local_14:int;
            var _local_16:* = null;
            var _local_15:* = null;
            var _local_19:* = null;
            var _local_20:* = null;
            var _local_8:int;
            var _local_12:* = null;
            _background = _style.getNewBackgroundSprite(_arg_2);
            _SafeStr_4532.bitmapData = _style.pointer;
            _SafeStr_4548 = _arg_3;
            var _local_11:int = ((_SafeStr_4147.roomChatSettings) ? ChatBubbleWidth.accordingToRoomChatSetting(_SafeStr_4147.roomChatSettings.bubbleWidth) : 300);
            var _local_9:int = ((_local_11 - _style.textFieldMargins.x) - _style.textFieldMargins.width);
            _SafeStr_4533.width = _local_9;
            _SafeStr_4533.multiline = true;
            _SafeStr_4533.wordWrap = true;
            _SafeStr_4533.selectable = false;
            _SafeStr_4533.thickness = -15;
            _SafeStr_4533.sharpness = 80;
            _SafeStr_4533.antiAliasType = "advanced";
            _SafeStr_4533.embedFonts = true;
            _SafeStr_4533.gridFitType = "pixel";
            _SafeStr_4533.cacheAsBitmap = (!(_style.allowHTML));
            _SafeStr_4533.styleSheet = null;
            _SafeStr_4533.defaultTextFormat = _style.textFormat;
            _SafeStr_4533.styleSheet = _style.styleSheet;
            _SafeStr_4533.addEventListener("link", onTextLinkEvent);
            var _local_7:* = (_SafeStr_4534.chatType == 0);
            var _local_6:* = (_SafeStr_4534.chatType == 2);
            var _local_13:Boolean = (((!(_local_7)) && (!(_local_6))) && (!(_style.isAnonymous)));
            if (_local_13)
            {
                _SafeStr_4533.alpha = 0.6;
            }
            else
            {
                _SafeStr_4533.alpha = 1;
            };
            var _local_18:String = (((_local_13) ? "<i>" : "") + ((_style.isAnonymous) ? "" : (("<b>" + _arg_1) + ": </b>")));
            _local_18 = (((_local_18 + ((_local_6) ? "<b>" : "")) + _SafeStr_4534.text) + ((_local_6) ? "</b>" : ""));
            _local_18 = (_local_18 + ((_local_13) ? "</i>" : ""));
            if (((_SafeStr_4534.links == null) || (_SafeStr_4534.links[0] == null)))
            {
                _SafeStr_4533.htmlText = _local_18;
            }
            else
            {
                _local_14 = -1;
                _local_16 = [];
                _local_10 = 0;
                while (_local_10 < _SafeStr_4534.links.length)
                {
                    _local_15 = _SafeStr_4534.links[_local_10][0][1];
                    _local_19 = (((('<a href="' + _local_15) + '">') + _local_15) + "</a>");
                    _local_20 = (("{" + _local_10) + "}");
                    _local_8 = _SafeStr_4534.text.indexOf(_local_20);
                    _local_14 = (_local_8 + _local_19.length);
                    _local_16.push([_local_8, _local_14]);
                    _local_18 = _local_18.replace(_local_20, _local_19);
                    _local_10++;
                };
                _SafeStr_4533.htmlText = _local_18;
            };
            _SafeStr_4551 = _arg_4;
            var _local_17:int = Math.min(_local_11, ((_SafeStr_4533.textWidth + _style.textFieldMargins.x) + _style.textFieldMargins.width));
            var _local_5:int = ((_SafeStr_4533.textHeight + _style.textFieldMargins.y) + _style.textFieldMargins.height);
            if (!_style.isSystemStyle)
            {
                _local_5 = Math.min(108, _local_5);
            };
            if (_arg_4 != -1)
            {
                _local_5 = Math.max(_arg_4, _local_5);
            };
            _local_17 = Math.max(_local_17, _background.width);
            _local_5 = Math.max(_local_5, _background.height);
            _background.width = _local_17;
            _background.height = _local_5;
            _background.x = 0;
            _background.y = 0;
            _background.cacheAsBitmap = true;
            addChild(_background);
            if (!_style.isAnonymous)
            {
                _SafeStr_4532.x = Math.max(28, Math.min(15, userRelativePosX));
                _SafeStr_4532.y = (_local_5 - _style.pointerOffsetToBubbleBottom);
                addChild(_SafeStr_4532);
            };
            if (((!(_SafeStr_4535 == null)) && (!(_style.faceOffset == null))))
            {
                if (_SafeStr_4535.height > _local_5)
                {
                    _local_12 = new BitmapData(_SafeStr_4535.width, _local_5);
                    _local_12.copyPixels(_SafeStr_4535, new Rectangle(0, (_SafeStr_4535.height - _local_5), _SafeStr_4535.width, _local_5), new Point(0, 0));
                }
                else
                {
                    _local_12 = _SafeStr_4535;
                };
                _SafeStr_4536.bitmapData = _local_12;
                _SafeStr_4536.x = (_style.faceOffset.x - (_local_12.width / 2));
                _SafeStr_4536.y = Math.max(1, (_style.faceOffset.y - (_local_12.height / 2)));
                addChild(_SafeStr_4536);
            };
            _SafeStr_4533.width = Math.min(_local_9, (_SafeStr_4533.textWidth + _style.textFieldMargins.width));
            _SafeStr_4533.height = (_SafeStr_4533.textHeight + _style.textFieldMargins.height);
            _SafeStr_4533.x = _style.textFieldMargins.x;
            _SafeStr_4533.y = _style.textFieldMargins.y;
            addChild(_SafeStr_4533);
            if (((!(_style.isSystemStyle)) && (_SafeStr_4533.textHeight > 108)))
            {
                _SafeStr_4537.graphics.clear();
                _SafeStr_4537.graphics.beginFill(0xFFFFFF);
                _SafeStr_4537.graphics.drawRect(0, 0, (_SafeStr_4533.textWidth + 5), (108 - _style.textFieldMargins.height));
                _SafeStr_4537.graphics.endFill();
                _SafeStr_4533.mask = _SafeStr_4537;
                addChild(_SafeStr_4537);
                _SafeStr_4537.x = _SafeStr_4533.x;
                _SafeStr_4537.y = _SafeStr_4533.y;
            }
            else
            {
                _SafeStr_4537.graphics.clear();
                _SafeStr_4533.mask = null;
            };
            this.cacheAsBitmap = (!(_style.allowHTML));
            _SafeStr_4550 = false;
            _SafeStr_4540 = 0;
            _SafeStr_4546 = 0;
            visible = false;
        }

        public function unregister():void
        {
            this.cacheAsBitmap = false;
            this.removeEventListener("click", onMouseClick);
            if (_SafeStr_4537.parent == this)
            {
                safelyRemoveChild(_SafeStr_4537);
            };
            safelyRemoveChild(_SafeStr_4533);
            if (((!(_style.faceOffset == null)) && (_SafeStr_4536.parent == this)))
            {
                safelyRemoveChild(_SafeStr_4536);
                _SafeStr_4536.bitmapData = null;
            };
            if (((_SafeStr_4532) && (_SafeStr_4532.parent)))
            {
                safelyRemoveChild(_SafeStr_4532);
            };
            safelyRemoveChild(_background);
            if (_SafeStr_4533)
            {
                _SafeStr_4533.removeEventListener("link", onTextLinkEvent);
            };
        }

        private function onTextLinkEvent(_arg_1:TextEvent):void
        {
            var _local_7:* = null;
            var _local_4:* = null;
            var _local_3:* = null;
            var _local_2:* = null;
            var _local_5:* = null;
            var _local_6:* = null;
            if (((_arg_1.text) && (_arg_1.text.length > 0)))
            {
                _local_7 = _arg_1.text;
                _local_4 = "highlight/";
                if (_local_7.indexOf(_local_4) > -1)
                {
                    _local_3 = (_arg_1.target as TextField);
                    _local_2 = new Point(_local_3.mouseX, _local_3.mouseY);
                    _local_2 = _local_3.localToGlobal(_local_2);
                    _local_5 = new Rectangle(_local_2.x, _local_2.y);
                    _local_6 = _local_7.substr((_local_7.indexOf(_local_4) + _local_4.length), _local_7.length);
                    _SafeStr_4147.windowManager.hideHint();
                    _SafeStr_4147.windowManager.showHint(_local_6.toLocaleUpperCase(), _local_5);
                }
                else
                {
                    _SafeStr_4147.context.createLinkEvent(_arg_1.text);
                };
            };
        }

        private function safelyRemoveChild(_arg_1:DisplayObject):void
        {
            try
            {
                removeChild(_arg_1);
            }
            catch(error:ArgumentError)
            {
            };
        }

        public function get displayedHeight():Number
        {
            return ((_style.isSystemStyle) ? height : Math.min(108, height));
        }

        private function onAddedToStage(_arg_1:Event):void
        {
            this.addEventListener("click", onMouseClick);
        }

        private function onRemovedFromStage(_arg_1:Event):void
        {
            this.removeEventListener("click", onMouseClick);
        }

        public function moveTo(_arg_1:int, _arg_2:int):void
        {
            if (((!(_SafeStr_4538 == _arg_1)) || (!(_SafeStr_4539 == _arg_2))))
            {
                _SafeStr_4541 = _SafeStr_4540;
                _SafeStr_4542 = proxyX;
                _SafeStr_4544 = y;
                _SafeStr_4538 = _arg_1;
                _SafeStr_4539 = _arg_2;
                _SafeStr_4543 = ((_arg_1 - proxyX) / 150);
                _SafeStr_4545 = ((_arg_2 - y) / 150);
            };
        }

        public function warpTo(_arg_1:int, _arg_2:int):void
        {
            _SafeStr_4538 = _arg_1;
            _SafeStr_4539 = _arg_2;
            proxyX = _arg_1;
            y = _arg_2;
        }

        public function update(_arg_1:uint):void
        {
            var _local_2:uint;
            _SafeStr_4540 = (_SafeStr_4540 + _arg_1);
            if (((!(proxyX == _SafeStr_4538)) || (!(y == _SafeStr_4539))))
            {
                _local_2 = (_SafeStr_4540 - _SafeStr_4541);
                if (((_local_2 < 150) && (_local_2 > 0)))
                {
                    proxyX = (_SafeStr_4542 + (_local_2 * _SafeStr_4543));
                    y = (_SafeStr_4544 + (_local_2 * _SafeStr_4545));
                }
                else
                {
                    proxyX = _SafeStr_4538;
                    y = _SafeStr_4539;
                };
            };
            if (_SafeStr_4540 > (_SafeStr_4546 + 2000))
            {
                repositionPointer();
                _SafeStr_4546 = _SafeStr_4540;
            };
            if (((_SafeStr_4540 > 150) && (!(visible))))
            {
                visible = true;
            };
        }

        public function get proxyX():int
        {
            return (_SafeStr_4547);
        }

        public function set proxyX(_arg_1:int):void
        {
            var _local_2:int;
            var _local_3:int;
            _SafeStr_4547 = _arg_1;
            if (((_SafeStr_4548) && (stage)))
            {
                _local_2 = (_SafeStr_4547 + _SafeStr_4549);
                _hasHitDesktopMargin = false;
                _local_3 = ((stage.stageWidth - 190) - width);
                if (_local_2 > _local_3)
                {
                    _local_2 = _local_3;
                    _hasHitDesktopMargin = true;
                };
                if (_local_2 < 85)
                {
                    _local_2 = 85;
                    _hasHitDesktopMargin = true;
                };
                x = _local_2;
            }
            else
            {
                x = (_SafeStr_4547 + _SafeStr_4549);
            };
        }

        public function repositionPointer():void
        {
            if (((_SafeStr_4532) && (_SafeStr_4532.parent)))
            {
                _SafeStr_4532.x = Math.max(28, Math.min((_background.width - 15), userRelativePosX));
                _SafeStr_4532.y = (_background.height - _style.pointerOffsetToBubbleBottom);
            };
        }

        public function get readyToRecycle():Boolean
        {
            return (_SafeStr_4550);
        }

        public function set readyToRecycle(_arg_1:Boolean):void
        {
            _SafeStr_4550 = _arg_1;
            if (_arg_1)
            {
                this.removeEventListener("click", onMouseClick);
            };
        }

        public function get timeStamp():uint
        {
            return (_SafeStr_4534.timeStamp);
        }

        public function set component(_arg_1:HabboFreeFlowChat):void
        {
            _SafeStr_4147 = _arg_1;
        }

        private function get userRelativePosX():int
        {
            return (userScreenPos.x - this.x);
        }

        public function get userScreenPos():Point
        {
            if (_SafeStr_4534.forcedScreenLocation)
            {
                return (new Point(((_SafeStr_4147.displayObject.stage.stageWidth / 2) + _SafeStr_4534.forcedScreenLocation), 500));
            };
            return (_SafeStr_4147.getScreenPointFromRoomLocation(_SafeStr_4534.roomId, _SafeStr_4534.userLocation));
        }

        public function get roomId():int
        {
            return (_SafeStr_4534.roomId);
        }

        public function set roomPanOffsetX(_arg_1:int):void
        {
            if (_SafeStr_4549 != _arg_1)
            {
                _SafeStr_4549 = _arg_1;
                warpTo(_SafeStr_4538, _SafeStr_4539);
            };
        }

        private function onMouseClick(_arg_1:MouseEvent):void
        {
            if (((_style) && (_style.isAnonymous)))
            {
                return;
            };
            if (!_SafeStr_4147.clickHasToPropagate(_arg_1))
            {
                _SafeStr_4147.selectAvatarWithChatItem(_SafeStr_4534);
                _arg_1.stopImmediatePropagation();
            };
        }

        public function get overlap():Rectangle
        {
            return (_style.overlap);
        }

        public function get hasHitDesktopMargin():Boolean
        {
            return (_hasHitDesktopMargin);
        }

        public function get minHeight():int
        {
            return (_SafeStr_4551);
        }


    }
}//package com.sulake.habbo.freeflowchat.viewer.visualization

// _SafeStr_3335 = "_-sO" (String#7785, DoABC#4)
// _SafeStr_4147 = "_-Q1a" (String#196, DoABC#4)
// _SafeStr_4532 = "_-w4" (String#2564, DoABC#4)
// _SafeStr_4533 = "_-Y1E" (String#1108, DoABC#4)
// _SafeStr_4534 = "_-MS" (String#2979, DoABC#4)
// _SafeStr_4535 = "_-51f" (String#7525, DoABC#4)
// _SafeStr_4536 = "_-61A" (String#2935, DoABC#4)
// _SafeStr_4537 = "_-ob" (String#2302, DoABC#4)
// _SafeStr_4538 = "_-LF" (String#4323, DoABC#4)
// _SafeStr_4539 = "_-r19" (String#4283, DoABC#4)
// _SafeStr_4540 = "_-N17" (String#4531, DoABC#4)
// _SafeStr_4541 = "_-Zg" (String#10065, DoABC#4)
// _SafeStr_4542 = "_-mw" (String#8841, DoABC#4)
// _SafeStr_4543 = "_-vZ" (String#9385, DoABC#4)
// _SafeStr_4544 = "_-W1x" (String#9946, DoABC#4)
// _SafeStr_4545 = "_-Gz" (String#9024, DoABC#4)
// _SafeStr_4546 = "_-5O" (String#13027, DoABC#4)
// _SafeStr_4547 = "_-rg" (String#6221, DoABC#4)
// _SafeStr_4548 = "_-Z1d" (String#9754, DoABC#4)
// _SafeStr_4549 = "_-g1z" (String#5919, DoABC#4)
// _SafeStr_4550 = "_-uu" (String#7360, DoABC#4)
// _SafeStr_4551 = "_-XD" (String#3918, DoABC#4)
// _SafeStr_8541 = "_-qa" (String#29230, DoABC#4)


