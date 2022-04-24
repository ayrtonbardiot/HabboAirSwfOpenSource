// by nota

//com.sulake.habbo.ui.widget.roomchat.RoomChatHistoryViewer

package com.sulake.habbo.ui.widget.roomchat
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.window.components.IScrollbarWindow;
    import com.sulake.core.window.components.IItemListWindow;
    import flash.geom.Rectangle;
    import com.sulake.core.window.components.IScrollableWindow;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.assets._SafeStr_21;
    import flash.events.MouseEvent;

    public class RoomChatHistoryViewer implements _SafeStr_13 
    {

        private static const CHAT_ITEM_HEIGHT:int = 18;
        private static const SCROLLBAR_WIDTH:int = 20;
        public static const MOUSE_HYSTERESIS_TOLERANCE:int = 3;

        private var _historyPulldown:RoomChatHistoryPulldown;
        private var _historyViewerActive:Boolean = false;
        private var _historyViewerDragStartY:Number = -1;
        private var _SafeStr_5474:IScrollbarWindow;
        private var _SafeStr_5475:Number = 1;
        private var _SafeStr_3960:Boolean = false;
        private var _SafeStr_4981:RoomChatWidget;
        private var _SafeStr_4036:Boolean = false;
        private var _SafeStr_5477:Boolean = false;
        private var _SafeStr_5476:Boolean = false;

        public function RoomChatHistoryViewer(_arg_1:RoomChatWidget, _arg_2:_SafeStr_1695, _arg_3:_SafeStr_3133, _arg_4:_SafeStr_21)
        {
            _SafeStr_4036 = false;
            _SafeStr_4981 = _arg_1;
            _historyPulldown = new RoomChatHistoryPulldown(_arg_1, _arg_2, _arg_3, _arg_4);
            _historyPulldown.state = 0;
            var _local_5:IItemListWindow = (_arg_3.getChildByName("chat_contentlist") as IItemListWindow);
            if (_local_5 == null)
            {
                return;
            };
            _arg_3.removeChild(_local_5);
            _arg_3.addChild(_local_5);
            _SafeStr_5474 = (_arg_2.createWindow("chatscroller", "", 131, 0, (0x10 | 0x00), new Rectangle((_arg_3.right - 20), _arg_3.y, 20, (_arg_3.height - 39)), null, 0) as IScrollbarWindow);
            _arg_3.addChild(_SafeStr_5474);
            _SafeStr_5474.visible = false;
            _SafeStr_5474.scrollable = (_local_5 as IScrollableWindow);
        }

        public function set disabled(_arg_1:Boolean):void
        {
            _SafeStr_3960 = _arg_1;
        }

        public function set visible(_arg_1:Boolean):void
        {
            if (((_historyPulldown == null) || (_SafeStr_3960)))
            {
                return;
            };
            _historyPulldown.state = ((_arg_1) ? 1 : 0);
        }

        public function get active():Boolean
        {
            return (_historyViewerActive);
        }

        public function get scrollbarWidth():Number
        {
            return ((_historyViewerActive) ? 20 : 0);
        }

        public function get pulldownBarHeight():Number
        {
            return (39);
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_4036);
        }

        public function get visible():Boolean
        {
            if (_historyPulldown == null)
            {
                return (false);
            };
            return ((_historyPulldown.state == 1) || (_historyPulldown.state == 2));
        }

        public function dispose():void
        {
            hideHistoryViewer();
            if (_SafeStr_5474 != null)
            {
                _SafeStr_5474.dispose();
                _SafeStr_5474 = null;
            };
            if (_historyPulldown != null)
            {
                _historyPulldown.dispose();
                _historyPulldown = null;
            };
            _SafeStr_4036 = true;
        }

        public function update(_arg_1:uint):void
        {
            if (_historyPulldown != null)
            {
                _historyPulldown.update(_arg_1);
            };
            moveHistoryScroll();
        }

        public function toggleHistoryViewer():void
        {
            if (_historyViewerActive)
            {
                hideHistoryViewer();
            }
            else
            {
                showHistoryViewer();
            };
        }

        public function hideHistoryViewer():void
        {
            _SafeStr_5475 = 1;
            cancelDrag();
            _historyViewerActive = false;
            setHistoryViewerScrollbar(false);
            _historyPulldown.state = 0;
            if (_SafeStr_4981 != null)
            {
                _SafeStr_4981.resetArea();
                _SafeStr_4981.enableDragTooltips();
                _SafeStr_4981.handler.container.toolbar.extensionView.extraMargin = 0;
            };
        }

        public function showHistoryViewer():void
        {
            var _local_1:* = null;
            var _local_3:int;
            var _local_2:* = null;
            if (((!(_historyViewerActive)) && (!(_SafeStr_3960))))
            {
                _historyViewerActive = true;
                setHistoryViewerScrollbar(true);
                _historyPulldown.state = 1;
                if (_SafeStr_4981 != null)
                {
                    _SafeStr_4981.reAlignItemsToHistoryContent();
                    _SafeStr_4981.disableDragTooltips();
                };
            };
        }

        private function setHistoryViewerScrollbar(_arg_1:Boolean):void
        {
            if (_SafeStr_5474 != null)
            {
                _SafeStr_5474.visible = _arg_1;
                if (_arg_1)
                {
                    _SafeStr_5474.scrollV = 1;
                    _SafeStr_5475 = 1;
                }
                else
                {
                    _historyViewerActive = false;
                    _historyViewerDragStartY = -1;
                };
            };
        }

        public function containerResized(_arg_1:Rectangle, _arg_2:Boolean=false):void
        {
            if (_SafeStr_5474 != null)
            {
                _SafeStr_5474.x = ((_arg_1.x + _arg_1.width) - _SafeStr_5474.width);
                _SafeStr_5474.y = _arg_1.y;
                _SafeStr_5474.height = (_arg_1.height - 39);
                if (_arg_2)
                {
                    _SafeStr_5474.scrollV = _SafeStr_5475;
                };
            };
            if (_historyPulldown != null)
            {
                _historyPulldown.containerResized(_arg_1);
            };
        }

        private function processDrag(_arg_1:Number, _arg_2:Boolean=false):void
        {
            var _local_8:Number;
            var _local_4:Number;
            var _local_5:Number;
            var _local_3:int;
            var _local_6:Boolean;
            var _local_7:Boolean;
            if (((_historyViewerDragStartY > 0) && (_arg_2)))
            {
                if (_SafeStr_5476)
                {
                    if (Math.abs((_arg_1 - _historyViewerDragStartY)) > 3)
                    {
                        _SafeStr_5476 = false;
                    }
                    else
                    {
                        return;
                    };
                };
                if (!_historyViewerActive)
                {
                    _SafeStr_4981.resizeContainerToLowestItem();
                    showHistoryViewer();
                    moveHistoryScroll();
                };
                if (_historyViewerActive)
                {
                    _SafeStr_4981.handler.container.toolbar.extensionView.extraMargin = 20;
                    moveHistoryScroll();
                    _local_4 = (_SafeStr_5474.scrollable.scrollableRegion.height / _SafeStr_5474.scrollable.visibleRegion.height);
                    _local_5 = ((_arg_1 - _historyViewerDragStartY) / _SafeStr_5474.height);
                    _local_8 = (_SafeStr_5475 - (_local_5 / _local_4));
                    _local_8 = Math.max(0, _local_8);
                    _local_8 = Math.min(1, _local_8);
                    _local_3 = (_arg_1 - _historyViewerDragStartY);
                    _local_6 = true;
                    _local_7 = true;
                    if (_SafeStr_5474.scrollV < (1 - (18 / _SafeStr_5474.scrollable.scrollableRegion.height)))
                    {
                        _local_7 = false;
                    };
                    if (((_local_7) || (_SafeStr_5477)))
                    {
                        _SafeStr_4981.stretchAreaBottomBy(_local_3);
                        _local_6 = false;
                        _SafeStr_5475 = 1;
                        _SafeStr_5474.scrollV = 1;
                    };
                    if (_local_6)
                    {
                        _SafeStr_5475 = _local_8;
                    };
                    _historyViewerDragStartY = _arg_1;
                };
            }
            else
            {
                _historyViewerDragStartY = -1;
            };
        }

        public function beginDrag(_arg_1:Number, _arg_2:Boolean=false):void
        {
            var _local_3:* = null;
            var _local_4:* = null;
            if (_SafeStr_3960)
            {
                return;
            };
            _historyViewerDragStartY = _arg_1;
            _SafeStr_5477 = _arg_2;
            _SafeStr_5476 = true;
            if (_SafeStr_5474 != null)
            {
                _SafeStr_5475 = _SafeStr_5474.scrollV;
            };
            if (_SafeStr_5474 != null)
            {
                _local_3 = _SafeStr_5474.context.getDesktopWindow().getDisplayObject();
                if (_local_3 != null)
                {
                    _local_4 = _local_3.stage;
                    if (_local_4 != null)
                    {
                        _local_4.addEventListener("mouseMove", onStageMouseMove);
                        _local_4.addEventListener("mouseUp", onStageMouseUp);
                    };
                };
            };
        }

        public function cancelDrag():void
        {
            var _local_1:* = null;
            var _local_2:* = null;
            _historyViewerDragStartY = -1;
            if (_SafeStr_5474 != null)
            {
                _local_1 = _SafeStr_5474.context.getDesktopWindow().getDisplayObject();
                if (_local_1 != null)
                {
                    _local_2 = _local_1.stage;
                    if (_local_2 != null)
                    {
                        _local_2.removeEventListener("mouseMove", onStageMouseMove);
                        _local_2.removeEventListener("mouseUp", onStageMouseUp);
                    };
                };
            };
        }

        private function moveHistoryScroll():void
        {
            if (!_historyViewerActive)
            {
                return;
            };
            if (_historyViewerDragStartY < 0)
            {
                return;
            };
            if (_SafeStr_5477)
            {
                return;
            };
            var _local_1:Number = (_SafeStr_5475 - _SafeStr_5474.scrollV);
            if (_local_1 == 0)
            {
                return;
            };
            if (Math.abs(_local_1) < 0.01)
            {
                _SafeStr_5474.scrollV = _SafeStr_5475;
            }
            else
            {
                _SafeStr_5474.scrollV = (_SafeStr_5474.scrollV + (_local_1 / 2));
            };
        }

        private function onStageMouseUp(_arg_1:MouseEvent):void
        {
            cancelDrag();
            if (_SafeStr_4981 != null)
            {
                _SafeStr_4981.mouseUp();
            };
        }

        private function onStageMouseMove(_arg_1:MouseEvent):void
        {
            processDrag(_arg_1.stageY, _arg_1.buttonDown);
        }


    }
}//package com.sulake.habbo.ui.widget.roomchat

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3960 = "_-h1m" (String#4565, DoABC#4)
// _SafeStr_4036 = "_-Mr" (String#290, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_5474 = "_-01q" (String#2453, DoABC#4)
// _SafeStr_5475 = "_-g1d" (String#4969, DoABC#4)
// _SafeStr_5476 = "_-g1p" (String#12321, DoABC#4)
// _SafeStr_5477 = "_-p15" (String#15103, DoABC#4)


