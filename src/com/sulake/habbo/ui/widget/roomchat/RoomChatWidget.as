// by nota

//com.sulake.habbo.ui.widget.roomchat.RoomChatWidget

package com.sulake.habbo.ui.widget.roomchat
{
    import com.sulake.habbo.ui.widget.RoomWidgetBase;
    import com.sulake.core.runtime._SafeStr_41;
    import com.sulake.habbo.ui.widget.roomchat.style.ChatBubbleFactory;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.IItemListWindow;
    import flash.geom.Point;
    import com.sulake.core.runtime._SafeStr_20;
    import com.sulake.core.runtime._SafeStr_19;
    import com.sulake.habbo.ui.handler.ChatWidgetHandler;
    import com.sulake.core.window.components._SafeStr_3216;
    import flash.geom.Rectangle;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.core.window._SafeStr_3109;
    import flash.utils.getTimer;
    import flash.events.IEventDispatcher;
    import com.sulake.room.utils.RoomEnterEffect;
    import com.sulake.habbo.ui.widget.events.RoomWidgetChatUpdateEvent;
    import flash.display.BitmapData;
    import com.sulake.habbo.ui.widget.events.RoomWidgetRoomViewUpdateEvent;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetRoomObjectMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetChatSelectAvatarMessage;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class RoomChatWidget extends RoomWidgetBase implements _SafeStr_41 
    {

        private static const CHAT_ITEM_LEVEL_HEIGHT:int = 19;
        private static const CHAT_ITEM_LEVEL_HEIGHT_SMALL:int = 10;
        private static const CHAT_ITEM_NONVISIBLE_MARGIN:int = 20;
        private static const CHAT_ITEM_REAL_HEIGHT:int = 32;
        private static const ANIMATION_STEP_INTERVAL_MS:int = 25;
        private static const ANIMATION_TIMEOUT_MS:int = 4000;
        private static const ANIMATION_TIMEOUT_SLOW_MS:int = 6000;
        private static const ANIMATION_STEP_PIXELS:int = 3;
        private static const MAX_BUFFER_SIZE:int = 1;
        private static const MAX_FAST_LEVELS_LORES:int = 8;
        private static const MAX_FAST_LEVELS_MIDRES:int = 10;
        private static const MAX_FAST_LEVELS_HIRES:int = 12;
        private static const MAX_SLOW_LEVELS:int = 0;
        private static const CHAT_AREA_HEIGHT_LORES:int = 171;
        private static const CHAT_AREA_HEIGHT_MIDRES:int = 209;
        private static const CHAT_AREA_HEIGHT_HIRES:int = 247;
        private static const CHAT_AREA_MARGIN_BOTTOM:int = 23;
        private static const FRIEND_BAR_MARGIN:int = 40;
        private static const DESKTOP_WINDOW_LAYER:uint = 1;
        private static const _SafeStr_9079:int = 750;
        private static const _SafeStr_9080:int = 1000;

        private static var _SafeStr_3774:ChatBubbleFactory = null;

        private var _timeoutTime:int = 0;
        private var _SafeStr_4589:int = 0;
        private var _SafeStr_4585:_SafeStr_3133;
        private var _SafeStr_4586:IItemListWindow;
        private var _SafeStr_4587:_SafeStr_3133;
        private var _itemList:Array = [];
        private var _SafeStr_4588:Array = [];
        private var _movingItems:Array = [];
        private var _SafeStr_4598:int;
        private var _SafeStr_4599:int = 0;
        private var _SafeStr_4594:Number = 1;
        private var _SafeStr_4591:String;
        private var _SafeStr_4592:Number = 1;
        private var _SafeStr_4593:Number = 0;
        private var _cameraOffset:Point = new Point();
        private var _historyViewer:RoomChatHistoryViewer;
        private var _SafeStr_4250:Boolean = false;
        private var _SafeStr_4600:Boolean = false;
        private var _SafeStr_4147:_SafeStr_20 = null;
        private var _config:_SafeStr_19;
        private var _SafeStr_4597:int = 150;
        private var _SafeStr_4584:int;
        private var _SafeStr_4590:int = 19;
        private var _SafeStr_4595:int = 100;
        private var _SafeStr_4596:int = 205;
        private var _SafeStr_4583:int;
        private var _maxFastLevels:int;

        public function RoomChatWidget(_arg_1:IRoomWidgetHandler, _arg_2:_SafeStr_1695, _arg_3:_SafeStr_21, _arg_4:_SafeStr_18, _arg_5:_SafeStr_19, _arg_6:int, _arg_7:_SafeStr_20)
        {
            super(_arg_1, _arg_2, _arg_3, _arg_4);
            (_arg_1 as ChatWidgetHandler).widget = this;
            _config = _arg_5;
            _SafeStr_4598 = _arg_6;
            var _local_9:_SafeStr_3216 = _arg_2.getDesktop(1);
            if (_local_9.height >= 1000)
            {
                _SafeStr_4583 = 247;
                _maxFastLevels = 12;
                _SafeStr_14.log("Hi-res chat desktop selected");
            }
            else
            {
                if (_local_9.height >= 750)
                {
                    _SafeStr_4583 = 209;
                    _maxFastLevels = 10;
                    _SafeStr_14.log("Mid-res chat desktop selected");
                }
                else
                {
                    _SafeStr_4583 = 171;
                    _maxFastLevels = 12;
                    _SafeStr_14.log("Lo-res chat desktop selected");
                };
            };
            _SafeStr_4584 = (_SafeStr_4583 + 23);
            _SafeStr_4585 = (_arg_2.createWindow("chat_container", "", 4, 0, 0, new Rectangle(0, 0, 200, (_SafeStr_4584 + 39)), null, 0) as _SafeStr_3133);
            _SafeStr_4585.background = true;
            _SafeStr_4585.color = 0x1FFFFFF;
            _SafeStr_4585.tags.push("room_widget_chat");
            _SafeStr_4586 = (_arg_2.createWindow("chat_contentlist", "", 50, 0, (0x10 | 0x0880), new Rectangle(0, 0, 200, _SafeStr_4584), null, 0) as IItemListWindow);
            _SafeStr_4586.disableAutodrag = true;
            _SafeStr_4585.addChild(_SafeStr_4586);
            _SafeStr_4587 = (_arg_2.createWindow("chat_active_content", "", 4, 0, 16, new Rectangle(0, 0, 200, _SafeStr_4584), null, 0) as _SafeStr_3133);
            _SafeStr_4587.clipping = false;
            _SafeStr_4586.addListItem(_SafeStr_4587);
            _historyViewer = new RoomChatHistoryViewer(this, _arg_2, _SafeStr_4585, _arg_3);
            _SafeStr_4591 = _arg_5.getProperty("site.url");
            _SafeStr_4597 = _arg_5.getInteger("chat.history.item.max.count", 150);
            var _local_8:Boolean = ((_arg_5.getBoolean("chat.history.disabled")) || (isGameSession));
            if (_historyViewer != null)
            {
                _historyViewer.disabled = _local_8;
            };
            if (_arg_7 != null)
            {
                _SafeStr_4147 = _arg_7;
                _SafeStr_4147.registerUpdateReceiver(this, 1);
            };
            if (!_SafeStr_3774)
            {
                _SafeStr_3774 = new ChatBubbleFactory(_arg_3, _arg_2, XML(_assets.getAssetByName("roomchat_styles_chatstyles_xml").content));
            };
        }

        public static function get chatBubbleFactory():ChatBubbleFactory
        {
            return (_SafeStr_3774);
        }


        override public function get mainWindow():_SafeStr_3109
        {
            return (_SafeStr_4585);
        }

        public function get config():_SafeStr_19
        {
            return (_config);
        }

        public function get handler():ChatWidgetHandler
        {
            return (_SafeStr_3914 as ChatWidgetHandler);
        }

        override public function dispose():void
        {
            var _local_1:* = null;
            var _local_2:int;
            if (disposed)
            {
                return;
            };
            while (_movingItems.length > 0)
            {
                _local_1 = _movingItems.shift();
            };
            _historyViewer.dispose();
            _historyViewer = null;
            while (_itemList.length > 0)
            {
                _local_1 = _itemList.shift();
                _local_1.dispose();
            };
            while (_SafeStr_4588.length > 0)
            {
                _local_1 = _SafeStr_4588.shift();
                _local_1.dispose();
            };
            _SafeStr_4585.dispose();
            if (_SafeStr_4147 != null)
            {
                _SafeStr_4147.removeUpdateReceiver(this);
                _SafeStr_4147 = null;
            };
            super.dispose();
        }

        public function update(_arg_1:uint):void
        {
            var _local_2:int;
            if (((getTimer() > _timeoutTime) && (_timeoutTime > 0)))
            {
                _timeoutTime = -1;
                animationStart();
            };
            if (_SafeStr_4250)
            {
                _local_2 = int(((_arg_1 / 25) * 3));
                if ((_local_2 + _SafeStr_4589) > _SafeStr_4590)
                {
                    _local_2 = (_SafeStr_4590 - _SafeStr_4589);
                };
                if (_local_2 > 0)
                {
                    moveItemsUp(_local_2);
                    _SafeStr_4589 = (_SafeStr_4589 + _local_2);
                };
                if (_SafeStr_4589 >= _SafeStr_4590)
                {
                    _SafeStr_4590 = 19;
                    _SafeStr_4589 = 0;
                    animationStop();
                    processBuffer();
                    _timeoutTime = (getTimer() + 4000);
                };
            };
            if (_historyViewer != null)
            {
                _historyViewer.update(_arg_1);
            };
        }

        override public function registerUpdateEvents(_arg_1:IEventDispatcher):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            _arg_1.addEventListener("RWCUE_EVENT_CHAT", onChatMessage);
            _arg_1.addEventListener("RWRVUE_ROOM_VIEW_SIZE_CHANGED", onRoomViewUpdate);
            _arg_1.addEventListener("RWRVUE_ROOM_VIEW_POSITION_CHANGED", onRoomViewUpdate);
            _arg_1.addEventListener("RWRVUE_ROOM_VIEW_SCALE_CHANGED", onRoomViewUpdate);
            super.registerUpdateEvents(_arg_1);
        }

        override public function unregisterUpdateEvents(_arg_1:IEventDispatcher):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            _arg_1.removeEventListener("RWCUE_EVENT_CHAT", onChatMessage);
            _arg_1.removeEventListener("RWRVUE_ROOM_VIEW_SIZE_CHANGED", onRoomViewUpdate);
            _arg_1.removeEventListener("RWRVUE_ROOM_VIEW_POSITION_CHANGED", onRoomViewUpdate);
            _arg_1.removeEventListener("RWRVUE_ROOM_VIEW_SCALE_CHANGED", onRoomViewUpdate);
        }

        private function onChatMessage(_arg_1:RoomWidgetChatUpdateEvent):void
        {
            if (((RoomEnterEffect.isRunning()) && (!(_arg_1.chatType == 1))))
            {
                return;
            };
            var _local_2:RoomChatItem = new RoomChatItem(this, windowManager, assets, getFreeItemId(), localizations, _SafeStr_4591);
            _local_2.define(_arg_1);
            addChatItem(_local_2);
        }

        public function addChatMessage(_arg_1:String, _arg_2:String, _arg_3:int, _arg_4:BitmapData, _arg_5:uint, _arg_6:Boolean):void
        {
            var _local_7:RoomChatItem = new RoomChatItem(this, windowManager, assets, getFreeItemId(), localizations, _SafeStr_4591);
            _local_7.message = _arg_1;
            _local_7.senderName = _arg_2;
            _local_7.senderX = _arg_3;
            _local_7.senderImage = _arg_4;
            _local_7.senderColor = _arg_5;
            if (_arg_6)
            {
                _local_7.chatType = 5;
            };
            _local_7.renderView();
            addChatItem(_local_7);
        }

        private function addChatItem(_arg_1:RoomChatItem):void
        {
            if (_SafeStr_4592 != 1)
            {
                _arg_1.senderX = (_arg_1.senderX / _SafeStr_4592);
            };
            _arg_1.senderX = (_arg_1.senderX - _cameraOffset.x);
            setChatItemLocHorizontal(_arg_1);
            _SafeStr_4588.push(_arg_1);
            processBuffer();
        }

        private function onRoomViewUpdate(_arg_1:RoomWidgetRoomViewUpdateEvent):void
        {
            var _local_2:Rectangle = _arg_1.rect;
            if (_arg_1.scale > 0)
            {
                if (_SafeStr_4593 == 0)
                {
                    _SafeStr_4593 = _arg_1.scale;
                }
                else
                {
                    _SafeStr_4592 = (_arg_1.scale / _SafeStr_4593);
                };
            };
            if (_arg_1.positionDelta != null)
            {
                _cameraOffset.x = (_cameraOffset.x + (_arg_1.positionDelta.x / _SafeStr_4592));
                _cameraOffset.y = (_cameraOffset.y + (_arg_1.positionDelta.y / _SafeStr_4592));
            };
            if (_arg_1.rect != null)
            {
                if (_historyViewer == null)
                {
                    return;
                };
                _SafeStr_4585.width = _local_2.width;
                _SafeStr_4585.height = (_SafeStr_4584 + _historyViewer.pulldownBarHeight);
                _SafeStr_4586.width = (_SafeStr_4585.width - _historyViewer.scrollbarWidth);
                _SafeStr_4586.height = _SafeStr_4584;
                _SafeStr_4586.x = _SafeStr_4585.x;
                _SafeStr_4586.y = _SafeStr_4585.y;
                _SafeStr_4587.width = (_SafeStr_4585.width - _historyViewer.scrollbarWidth);
                _SafeStr_4587.height = _SafeStr_4584;
                if (historyViewerActive())
                {
                    reAlignItemsToHistoryContent();
                };
                _historyViewer.containerResized(_SafeStr_4585.rectangle, true);
            };
            alignItems();
        }

        private function processBuffer():void
        {
            if (_SafeStr_4250)
            {
                return;
            };
            if (_SafeStr_4588.length == 0)
            {
                return;
            };
            while (((_SafeStr_4588.length > 1) || ((historyViewerActive()) && (_SafeStr_4588.length > 0))))
            {
                activateItemFromBuffer();
            };
            var _local_1:Boolean;
            if (_itemList.length == 0)
            {
                _local_1 = true;
            }
            else
            {
                _local_1 = checkLastItemAllowsAdding(_SafeStr_4588[0]);
            };
            if (_local_1)
            {
                activateItemFromBuffer();
                _timeoutTime = (getTimer() + 4000);
            }
            else
            {
                if (((_itemList.length > 0) && (_SafeStr_4588.length > 0)))
                {
                    _SafeStr_4590 = getItemSpacing(_itemList[(_itemList.length - 1)], _SafeStr_4588[0]);
                }
                else
                {
                    _SafeStr_4590 = 19;
                };
                animationStart();
            };
        }

        private function activateItemFromBuffer():void
        {
            var _local_2:* = null;
            var _local_3:* = null;
            var _local_1:int;
            if (_SafeStr_4588.length == 0)
            {
                return;
            };
            if (historyViewerMinimized())
            {
                resetArea();
                hideHistoryViewer();
            };
            if (!checkLastItemAllowsAdding(_SafeStr_4588[0]))
            {
                selectItemsToMove();
                moveItemsUp(getItemSpacing(_itemList[(_itemList.length - 1)], _SafeStr_4588[0]));
                if (!checkLastItemAllowsAdding(_SafeStr_4588[0]))
                {
                    _SafeStr_4587.height = (_SafeStr_4587.height + 19);
                    if (_historyViewer != null)
                    {
                        _historyViewer.containerResized(_SafeStr_4585.rectangle);
                    };
                };
            };
            _local_2 = _SafeStr_4588.shift();
            if (_local_2 != null)
            {
                _local_2.renderView();
                _local_3 = _local_2.view;
                if (_local_3 != null)
                {
                    _SafeStr_4587.addChild(_local_3);
                    _local_2.timeStamp = new Date().time;
                    _itemList.push(_local_2);
                    _local_1 = 0;
                    if (_itemList.length > 1)
                    {
                        _local_1 = _itemList[(_itemList.length - 2)].screenLevel;
                        if (historyViewerActive())
                        {
                            _local_2.screenLevel = (_local_1 + 1);
                        }
                        else
                        {
                            _local_2.screenLevel = (_local_1 + Math.max(_SafeStr_4594, 1));
                        };
                    }
                    else
                    {
                        _local_2.screenLevel = 100;
                    };
                    _local_2.aboveLevels = _SafeStr_4594;
                    if (_local_2.aboveLevels > ((_maxFastLevels + 0) + 2))
                    {
                        _local_2.aboveLevels = ((_maxFastLevels + 0) + 2);
                    };
                    _SafeStr_4594 = 0;
                    setChatItemLocHorizontal(_local_2);
                    setChatItemLocVertical(_local_2);
                    setChatItemRenderable(_local_2);
                };
            };
        }

        private function checkLastItemAllowsAdding(_arg_1:RoomChatItem):Boolean
        {
            if (_itemList.length == 0)
            {
                return (true);
            };
            var _local_2:RoomChatItem = _itemList[(_itemList.length - 1)];
            if (((_arg_1 == null) || (_local_2 == null)))
            {
                return (false);
            };
            if (_local_2.view == null)
            {
                return (true);
            };
            if (((_SafeStr_4587.bottom - ((_SafeStr_4587.y + _local_2.y) + _local_2.height)) - 23) <= getItemSpacing(_local_2, _arg_1))
            {
                return (false);
            };
            return (true);
        }

        public function alignItems():void
        {
            var _local_3:int;
            var _local_1:* = null;
            var _local_2:* = null;
            if (_historyViewer == null)
            {
                return;
            };
            _local_3 = (_itemList.length - 1);
            while (_local_3 >= 0)
            {
                _local_1 = _itemList[_local_3];
                if (_local_1 != null)
                {
                    setChatItemLocHorizontal(_local_1);
                    setChatItemLocVertical(_local_1);
                };
                _local_3--;
            };
            _local_3 = 0;
            while (_local_3 < _itemList.length)
            {
                _local_1 = _itemList[_local_3];
                if (_local_1 != null)
                {
                    setChatItemRenderable(_local_1);
                };
                _local_3++;
            };
            _local_3 = 0;
            while (_local_3 < _SafeStr_4588.length)
            {
                _local_1 = _SafeStr_4588[_local_3];
                if (_local_1 != null)
                {
                    setChatItemLocHorizontal(_local_1);
                };
                _local_3++;
            };
        }

        private function animationStart():void
        {
            if (_SafeStr_4250)
            {
                return;
            };
            selectItemsToMove();
            _SafeStr_4250 = true;
        }

        private function animationStop():void
        {
            _SafeStr_4250 = false;
        }

        private function selectItemsToMove():void
        {
            var _local_3:int;
            var _local_1:* = null;
            if (_SafeStr_4250)
            {
                return;
            };
            purgeItems();
            _movingItems = [];
            var _local_2:int = new Date().time;
            var _local_4:int;
            if (_itemList.length == 0)
            {
                _SafeStr_4594 = 1;
                return;
            };
            if (historyViewerActive())
            {
                return;
            };
            _SafeStr_4594++;
            _local_3 = (_itemList.length - 1);
            while (_local_3 >= 0)
            {
                _local_1 = _itemList[_local_3];
                if (_local_1.view != null)
                {
                    if ((((_local_1.screenLevel > 0) || (_local_1.screenLevel == (_local_4 - 1))) || ((_local_2 - _local_1.timeStamp) >= 6000)))
                    {
                        _local_1.timeStamp = _local_2;
                        _local_4 = _local_1.screenLevel;
                        _local_1.screenLevel--;
                        _movingItems.push(_local_1);
                    };
                };
                _local_3--;
            };
        }

        private function moveItemsUp(_arg_1:int):void
        {
            var _local_2:Boolean;
            var _local_5:int;
            if (_movingItems == null)
            {
                return;
            };
            if (_movingItems.length == 0)
            {
                return;
            };
            var _local_3:RoomChatItem;
            var _local_4:int = -1;
            _local_5 = (_movingItems.length - 1);
            while (_local_5 >= 0)
            {
                _local_3 = _movingItems[_local_5];
                if (_local_3 != null)
                {
                    if (_local_4 == -1)
                    {
                        _local_4 = _itemList.indexOf(_local_3);
                    }
                    else
                    {
                        _local_4++;
                    };
                    _local_2 = true;
                    if (historyViewerActive())
                    {
                        if (((_local_3.y - _arg_1) + _local_3.height) < 0)
                        {
                            _local_2 = false;
                        };
                    };
                    if (_local_4 > 0)
                    {
                        if (_itemList[(_local_4 - 1)].view != null)
                        {
                            if (((_local_3.y - _arg_1) - _itemList[(_local_4 - 1)].y) < getItemSpacing(_itemList[(_local_4 - 1)], _local_3))
                            {
                                _local_2 = false;
                            };
                        };
                    };
                    if (_local_2)
                    {
                        _local_3.y = (_local_3.y - _arg_1);
                    };
                };
                _local_5--;
            };
        }

        private function setChatItemLocHorizontal(_arg_1:RoomChatItem):void
        {
            var _local_4:Number;
            var _local_5:Number;
            if (((_arg_1 == null) || (_historyViewer == null)))
            {
                return;
            };
            var _local_2:Number = ((_arg_1.senderX + _cameraOffset.x) * _SafeStr_4592);
            var _local_3:Number = (_local_2 - (_arg_1.width / 2));
            var _local_8:Number = (_local_3 + _arg_1.width);
            var _local_7:Number = (((-(_SafeStr_4585.width) / 2) - 20) + _SafeStr_4595);
            var _local_6:Number = ((((_SafeStr_4585.width / 2) + 20) - _historyViewer.scrollbarWidth) - _SafeStr_4596);
            var _local_9:Boolean = ((_local_3 >= _local_7) && (_local_3 <= _local_6));
            var _local_10:Boolean = ((_local_8 >= _local_7) && (_local_8 <= _local_6));
            if (((_local_9) && (_local_10)))
            {
                _local_4 = _local_3;
                _local_5 = _local_4;
            }
            else
            {
                if (_local_2 >= 0)
                {
                    _local_4 = (_local_6 - _arg_1.width);
                }
                else
                {
                    _local_4 = _local_7;
                };
            };
            _arg_1.x = ((_local_4 + (_SafeStr_4585.width / 2)) + _SafeStr_4585.x);
            if (((_local_2 < _local_7) || (_local_2 > _local_6)))
            {
                _arg_1.hidePointer();
            }
            else
            {
                _arg_1.setPointerOffset((_local_3 - _local_4));
            };
        }

        private function setChatItemLocVertical(_arg_1:RoomChatItem):void
        {
            var _local_2:int;
            var _local_4:Number;
            var _local_3:Number;
            if (_arg_1 != null)
            {
                _local_2 = _itemList.indexOf(_arg_1);
                _local_4 = ((historyViewerActive()) ? 0 : _SafeStr_4594);
                if (_local_2 == (_itemList.length - 1))
                {
                    _arg_1.y = ((getAreaBottom() - ((_local_4 + 1) * 19)) - 23);
                }
                else
                {
                    _local_3 = _itemList[(_local_2 + 1)].aboveLevels;
                    if (_local_3 < 2)
                    {
                        _arg_1.y = (_itemList[(_local_2 + 1)].y - getItemSpacing(_arg_1, _itemList[(_local_2 + 1)]));
                    }
                    else
                    {
                        _arg_1.y = (_itemList[(_local_2 + 1)].y - (_local_3 * 19));
                    };
                };
            };
        }

        private function setChatItemRenderable(_arg_1:RoomChatItem):void
        {
            if (_arg_1 != null)
            {
                if (_arg_1.y < -(32))
                {
                    if (_arg_1.view != null)
                    {
                        _SafeStr_4587.removeChild(_arg_1.view);
                        _arg_1.hideView();
                    };
                }
                else
                {
                    if (_arg_1.view == null)
                    {
                        _arg_1.renderView();
                        if (_arg_1.view != null)
                        {
                            _SafeStr_4587.addChild(_arg_1.view);
                        };
                    };
                };
            };
        }

        public function getTotalContentHeight():int
        {
            var _local_1:* = null;
            var _local_3:int;
            var _local_2:int;
            _local_3 = 0;
            while (_local_3 < _itemList.length)
            {
                _local_1 = _itemList[_local_3];
                if (_local_1 != null)
                {
                    if (_local_3 == 0)
                    {
                        _local_2 = (_local_2 + 19);
                    }
                    else
                    {
                        _local_2 = (_local_2 + getItemSpacing(_itemList[(_local_3 - 1)], _local_1));
                    };
                    _local_2 = (_local_2 + ((_local_1.aboveLevels - 1) * 19));
                };
                _local_3++;
            };
            return (_local_2);
        }

        private function getAreaBottom():Number
        {
            if (historyViewerActive())
            {
                return (_SafeStr_4587.height);
            };
            return (_SafeStr_4584 + _SafeStr_4585.y);
        }

        private function getItemSpacing(_arg_1:RoomChatItem, _arg_2:RoomChatItem):Number
        {
            var _local_3:int = chatBubbleFactory.getActualBubbleHeight(_arg_1.chatStyle);
            if (_arg_1.checkOverlap(_local_3, _arg_2.x, _arg_1.y, _arg_2.width, _arg_2.height))
            {
                return (19);
            };
            return (10);
        }

        private function purgeItems():void
        {
            var _local_1:* = null;
            if (historyViewerActive())
            {
                return;
            };
            var _local_3:int;
            var _local_4:int;
            while (_itemList.length > _SafeStr_4597)
            {
                _local_1 = _itemList.shift();
                _local_4 = _movingItems.indexOf(_local_1);
                if (_local_4 > -1)
                {
                    _movingItems.splice(_local_4, 1);
                };
                if (_local_1.view != null)
                {
                    _SafeStr_4587.removeChild(_local_1.view);
                    _local_1.hideView();
                };
                _local_1.dispose();
                _local_1 = null;
            };
            var _local_2:Boolean;
            _local_3 = 0;
            while (_local_3 < _itemList.length)
            {
                _local_1 = _itemList[_local_3];
                if (_local_1 != null)
                {
                    if (_local_1.y <= -(32))
                    {
                        _local_1.aboveLevels = 1;
                        if (_local_1.view != null)
                        {
                            _local_4 = _movingItems.indexOf(_local_1);
                            if (_local_4 > -1)
                            {
                                _movingItems.splice(_local_4, 1);
                            };
                            _SafeStr_4587.removeChild(_local_1.view);
                            _local_1.hideView();
                        };
                    }
                    else
                    {
                        _local_2 = true;
                        break;
                    };
                };
                _local_3++;
            };
            if (_SafeStr_4588.length > 0)
            {
                _local_2 = true;
            };
            if ((((getTotalContentHeight() > 19) && (!(_local_2))) && (!(historyViewerActive()))))
            {
                if (_historyViewer != null)
                {
                    stretchAreaBottomTo(_SafeStr_4585.y);
                    alignItems();
                    if (!historyViewerActive())
                    {
                        _historyViewer.showHistoryViewer();
                    };
                    if (!historyViewerVisible())
                    {
                        _historyViewer.visible = true;
                    };
                };
            }
            else
            {
                if (historyViewerVisible())
                {
                    _historyViewer.visible = false;
                };
            };
        }

        private function getFreeItemId():String
        {
            return ((("chat_" + _SafeStr_4598.toString()) + "_item_") + _SafeStr_4599++.toString());
        }

        public function onItemMouseClick(_arg_1:int, _arg_2:String, _arg_3:int, _arg_4:int, _arg_5:WindowMouseEvent):void
        {
            if (_arg_5.shiftKey)
            {
                if (_historyViewer != null)
                {
                    _historyViewer.toggleHistoryViewer();
                };
                return;
            };
            var _local_7:RoomWidgetRoomObjectMessage = new RoomWidgetRoomObjectMessage("RWROM_GET_OBJECT_INFO", _arg_1, _arg_3);
            messageListener.processWidgetMessage(_local_7);
            var _local_6:RoomWidgetChatSelectAvatarMessage = new RoomWidgetChatSelectAvatarMessage("RWCSAM_MESSAGE_SELECT_AVATAR", _arg_1, _arg_2, _arg_4);
            messageListener.processWidgetMessage(_local_6);
        }

        public function onItemMouseDown(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:WindowMouseEvent):void
        {
            if (historyViewerVisible())
            {
                return;
            };
            if (_historyViewer != null)
            {
                _historyViewer.beginDrag(_arg_4.stageY, true);
            };
        }

        public function onItemMouseOver(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:WindowMouseEvent):void
        {
        }

        public function onItemMouseOut(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:WindowMouseEvent):void
        {
        }

        public function onPulldownMouseDown(_arg_1:WindowMouseEvent):void
        {
            if (_historyViewer != null)
            {
                _historyViewer.beginDrag(_arg_1.stageY, true);
            };
        }

        public function onPulldownCloseButtonClicked(_arg_1:WindowMouseEvent):void
        {
            if (_historyViewer != null)
            {
                _historyViewer.hideHistoryViewer();
            };
        }

        public function stretchAreaBottomBy(_arg_1:Number):void
        {
            var _local_2:Number = ((_SafeStr_4585.bottom + _arg_1) - 39);
            stretchAreaBottomTo(_local_2);
        }

        public function stretchAreaBottomTo(_arg_1:Number):void
        {
            var _local_2:int = ((_SafeStr_4585.context.getDesktopWindow().height - 39) - 40);
            _arg_1 = Math.min(_arg_1, _local_2);
            _SafeStr_4584 = (_arg_1 - _SafeStr_4585.y);
            _SafeStr_4585.height = (_SafeStr_4584 + 39);
            if (_historyViewer != null)
            {
                _historyViewer.containerResized(_SafeStr_4585.rectangle);
            };
        }

        public function resetArea(_arg_1:Boolean=true):void
        {
            if (_historyViewer == null)
            {
                return;
            };
            animationStop();
            _SafeStr_4584 = (_SafeStr_4583 + 23);
            _SafeStr_4585.height = (_SafeStr_4584 + _historyViewer.pulldownBarHeight);
            _SafeStr_4586.width = (_SafeStr_4585.width - _historyViewer.scrollbarWidth);
            _SafeStr_4586.height = _SafeStr_4584;
            _SafeStr_4587.width = (_SafeStr_4585.width - _historyViewer.scrollbarWidth);
            if (historyViewerActive())
            {
                _SafeStr_4587.height = (getTotalContentHeight() + 23);
            }
            else
            {
                _SafeStr_4587.height = _SafeStr_4584;
            };
            _SafeStr_4586.scrollV = 1;
            if (!historyViewerActive())
            {
                _historyViewer.containerResized(_SafeStr_4585.rectangle);
            };
            purgeItems();
            if (((historyViewerActive()) || (_arg_1)))
            {
                alignItems();
            };
        }

        private function historyViewerActive():Boolean
        {
            return ((_historyViewer == null) ? false : _historyViewer.active);
        }

        private function historyViewerVisible():Boolean
        {
            return ((_historyViewer == null) ? false : _historyViewer.visible);
        }

        public function hideHistoryViewer():void
        {
            if (_historyViewer != null)
            {
                _historyViewer.hideHistoryViewer();
            };
        }

        private function historyViewerMinimized():Boolean
        {
            return (_SafeStr_4586.height <= 1);
        }

        public function resizeContainerToLowestItem():void
        {
            var _local_3:int;
            var _local_1:* = null;
            var _local_4:int;
            _local_3 = 0;
            while (_local_3 < _itemList.length)
            {
                _local_1 = _itemList[_local_3];
                if (_local_1.y > _local_4)
                {
                    _local_4 = _local_1.y;
                };
                _local_3++;
            };
            _local_3 = 0;
            while (_local_3 < _SafeStr_4588.length)
            {
                _local_1 = _SafeStr_4588[_local_3];
                if (_local_1.y > _local_4)
                {
                    _local_4 = _local_1.y;
                };
                _local_3++;
            };
            _local_4 = (_local_4 + 32);
            _local_4 = ((_local_4 < 0) ? 0 : _local_4);
            var _local_2:int = _SafeStr_4585.bottom;
            stretchAreaBottomTo((_SafeStr_4585.top + _local_4));
            _local_2 = (_local_2 - _SafeStr_4585.bottom);
            if (Math.abs(_local_2) < 3)
            {
                resetArea();
                return;
            };
            _local_3 = 0;
            while (_local_3 < _itemList.length)
            {
                _local_1 = _itemList[_local_3];
                _local_1.y = (_local_1.y + _local_2);
                _local_3++;
            };
            _local_3 = 0;
            while (_local_3 < _SafeStr_4588.length)
            {
                _local_1 = _SafeStr_4588[_local_3];
                _local_1.y = (_local_1.y + _local_2);
                _local_3++;
            };
            _SafeStr_4600 = true;
        }

        public function mouseUp():void
        {
            _SafeStr_4586.stopDragging();
            var _local_1:Number = (_SafeStr_4585.bottom - 39);
            if (_local_1 < _SafeStr_4583)
            {
                if (_local_1 <= (_SafeStr_4584 + _SafeStr_4585.y))
                {
                    if (historyViewerActive())
                    {
                        hideHistoryViewer();
                    };
                    resetArea();
                    return;
                };
            };
            if (((_SafeStr_4600) && (!(historyViewerActive()))))
            {
                resetArea();
                _SafeStr_4600 = false;
            };
        }

        public function reAlignItemsToHistoryContent():void
        {
            if (historyViewerActive())
            {
                _SafeStr_4587.height = (getTotalContentHeight() + 23);
                alignItems();
            };
        }

        public function enableDragTooltips():void
        {
            var _local_2:int;
            var _local_1:RoomChatItem;
            _local_2 = 0;
            while (_local_2 < _itemList.length)
            {
                _local_1 = _itemList[_local_2];
                _local_1.enableDragTooltip();
                _local_2++;
            };
            _local_2 = 0;
            while (_local_2 < _SafeStr_4588.length)
            {
                _local_1 = _SafeStr_4588[_local_2];
                _local_1.enableDragTooltip();
                _local_2++;
            };
        }

        public function disableDragTooltips():void
        {
            var _local_2:int;
            var _local_1:RoomChatItem;
            _local_2 = 0;
            while (_local_2 < _itemList.length)
            {
                _local_1 = _itemList[_local_2];
                _local_1.disableDragTooltip();
                _local_2++;
            };
            _local_2 = 0;
            while (_local_2 < _SafeStr_4588.length)
            {
                _local_1 = _SafeStr_4588[_local_2];
                _local_1.disableDragTooltip();
                _local_2++;
            };
        }

        public function get isGameSession():Boolean
        {
            return (handler.container.roomSession.isGameSession);
        }

        public function removeItem(_arg_1:RoomChatItem):void
        {
            var _local_2:int;
            _local_2 = _itemList.indexOf(_arg_1);
            if (_local_2 > -1)
            {
                _itemList.splice(_local_2, 1);
            };
            _local_2 = _movingItems.indexOf(_arg_1);
            if (_local_2 > -1)
            {
                _movingItems.splice(_local_2, 1);
            };
            if (_arg_1.view != null)
            {
                _SafeStr_4587.removeChild(_arg_1.view);
                _arg_1.hideView();
            };
            _arg_1.dispose();
            resetArea(false);
        }


    }
}//package com.sulake.habbo.ui.widget.roomchat

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_19 = "_-01r" (String#1323, DoABC#4)
// _SafeStr_20 = "_-W1o" (String#542, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3216 = "_-o1L" (String#2319, DoABC#4)
// _SafeStr_3774 = "_-225" (String#4437, DoABC#4)
// _SafeStr_3914 = "_-w1m" (String#1204, DoABC#4)
// _SafeStr_41 = "_-m5" (String#2087, DoABC#4)
// _SafeStr_4147 = "_-Q1a" (String#196, DoABC#4)
// _SafeStr_4250 = "_-e1P" (String#3450, DoABC#4)
// _SafeStr_4583 = "_-Ri" (String#7823, DoABC#4)
// _SafeStr_4584 = "_-Fe" (String#4085, DoABC#4)
// _SafeStr_4585 = "_-ZD" (String#1375, DoABC#4)
// _SafeStr_4586 = "_-lh" (String#5112, DoABC#4)
// _SafeStr_4587 = "_-11q" (String#3606, DoABC#4)
// _SafeStr_4588 = "_-FH" (String#2972, DoABC#4)
// _SafeStr_4589 = "_-KR" (String#7912, DoABC#4)
// _SafeStr_4590 = "_-u14" (String#7070, DoABC#4)
// _SafeStr_4591 = "_-t1s" (String#4581, DoABC#4)
// _SafeStr_4592 = "_-61V" (String#8067, DoABC#4)
// _SafeStr_4593 = "_-31V" (String#15268, DoABC#4)
// _SafeStr_4594 = "_-lg" (String#6798, DoABC#4)
// _SafeStr_4595 = "_-gM" (String#29733, DoABC#4)
// _SafeStr_4596 = "_-k1" (String#30973, DoABC#4)
// _SafeStr_4597 = "_-Ca" (String#22696, DoABC#4)
// _SafeStr_4598 = "_-b1D" (String#9596, DoABC#4)
// _SafeStr_4599 = "_-Il" (String#18845, DoABC#4)
// _SafeStr_4600 = "_-B5" (String#13147, DoABC#4)
// _SafeStr_9079 = "_-bA" (String#31767, DoABC#4)
// _SafeStr_9080 = "_-T1K" (String#40047, DoABC#4)


