// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.roomtools.RoomToolsToolbarCtrl

package com.sulake.habbo.ui.widget.roomtools
{
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.core.window.components.IItemListWindow;
    import flash.geom.Point;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.motion.Queue;
    import com.sulake.core.window.motion.EaseOut;
    import com.sulake.core.window.motion.MoveTo;
    import com.sulake.core.window.motion.Callback;
    import com.sulake.core.window.motion._SafeStr_3336;
    import com.sulake.core.window.motion.Motion;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetZoomToggleMessage;
    import com.sulake.habbo.tracking.HabboTracking;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import flash.system.System;
    import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
    import com.sulake.core.window.events._SafeStr_3116;

    public class RoomToolsToolbarCtrl extends RoomToolsCtrlBase 
    {

        private static const TOOLBAR_EXPAND_TARGET_X:int = 1;
        private static const TOOLBAR_COLLAPSE_TARGET_X:int = -130;

        private var _SafeStr_6307:RoomToolsHistory;

        public function RoomToolsToolbarCtrl(_arg_1:RoomToolsWidget, _arg_2:_SafeStr_1695, _arg_3:_SafeStr_21)
        {
            super(_arg_1, _arg_2, _arg_3);
            _window = (_arg_2.buildFromXML((_arg_3.getAssetByName("room_tools_toolbar_xml").content as XML)) as _SafeStr_3133);
            _window.procedure = onWindowEvent;
            _window.addEventListener("WME_OVER", onWindowEvent);
            _window.addEventListener("WME_OUT", onWindowEvent);
            updateVisuals();
        }

        override public function dispose():void
        {
            if (_SafeStr_6307)
            {
                _SafeStr_6307.dispose();
                _SafeStr_6307 = null;
            };
            var _local_1:_SafeStr_3133 = (_SafeStr_4981.windowManager.getWindowByName("share_room_link") as _SafeStr_3133);
            if (_local_1)
            {
                _local_1.dispose();
            };
            super.dispose();
        }

        public function updateRoomHistoryButtons():void
        {
            if (_SafeStr_4981.currentRoomIndex >= (_SafeStr_4981.visitedRooms.length - 1))
            {
                _window.findChildByName("button_history_forward").disable();
            }
            else
            {
                _window.findChildByName("button_history_forward").enable();
            };
            if (_SafeStr_4981.currentRoomIndex == 0)
            {
                _window.findChildByName("button_history_back").disable();
            }
            else
            {
                _window.findChildByName("button_history_back").enable();
            };
            if (_SafeStr_4981.visitedRooms.length <= 1)
            {
                _window.findChildByName("button_history").disable();
            }
            else
            {
                _window.findChildByName("button_history").enable();
            };
        }

        public function disableRoomHistoryButtons():void
        {
            _window.findChildByName("button_history_forward").disable();
            _window.findChildByName("button_history_back").disable();
        }

        private function toggleHistory():void
        {
            if (_SafeStr_6307)
            {
                _SafeStr_6307.dispose();
                _SafeStr_6307 = null;
            }
            else
            {
                _SafeStr_6307 = new RoomToolsHistory(_windowManager, _assets, handler);
                _SafeStr_6307.populate(_SafeStr_4981.visitedRooms);
                updatePosition();
            };
        }

        public function setChatHistoryButton(_arg_1:Boolean):void
        {
            setElementVisible("button_chat_history", _arg_1);
        }

        public function setCameraButton(_arg_1:Boolean):void
        {
            setElementVisible("button_camera", _arg_1);
        }

        public function setLikeButton(_arg_1:Boolean):void
        {
            setElementVisible("button_like", _arg_1);
        }

        override public function setElementVisible(_arg_1:String, _arg_2:Boolean):void
        {
            if (!_window)
            {
                return;
            };
            _window.visible = true;
            super.setElementVisible(_arg_1, _arg_2);
            updatePosition();
        }

        public function updatePosition():void
        {
            var _local_3:* = null;
            var _local_5:* = null;
            var _local_7:* = null;
            var _local_4:* = null;
            var _local_1:int;
            var _local_6:int;
            var _local_2:* = null;
            if (_SafeStr_6103)
            {
                _local_3 = _window.findChildByName("side_bar_expand");
                _local_3.y = (_window.height - _local_3.height);
            }
            else
            {
                _local_5 = _window.findChildByName("arrow_collapse");
                _local_7 = (_window.findChildByName("itemlist_buttons") as IItemListWindow);
                _local_4 = _window.findChildByName("side_bar_collapse");
                _local_1 = 0;
                _local_6 = 0;
                while (_local_6 < _local_7.numListItems)
                {
                    _local_2 = _local_7.getListItemAt(_local_6);
                    if (_local_2.visible)
                    {
                        _local_1 = (_local_1 + _local_2.height);
                    };
                    _local_6++;
                };
                _local_4.height = _local_1;
                var _local_8:* = _local_1;
                _window.findChildByName("window_bg").height = _local_8;
                _local_7.height = _local_8;
                _window.height = _local_8;
                _local_5.y = ((_local_1 * 0.5) - (_local_5.height * 0.5));
            };
            _window.position = new Point(-5, ((_window.desktop.height - 55) - _window.height));
            if (_SafeStr_6307)
            {
                _SafeStr_6307.window.position = new Point((right - _SafeStr_6307.window.width), (_window.position.y - _SafeStr_6307.window.height));
            };
        }

        override public function setCollapsed(_arg_1:Boolean):void
        {
            var _local_3:* = null;
            if (((_SafeStr_6103 == _arg_1) || (!(_window))))
            {
                return;
            };
            _SafeStr_6103 = _arg_1;
            var _local_2:_SafeStr_3109 = _window.findChildByName("window_bg");
            if (!_local_2)
            {
                return;
            };
            if (_SafeStr_6103)
            {
                _local_3 = new Queue(new EaseOut(new MoveTo(_local_2, 100, -130, _local_2.y), 1), new Callback(motionComplete));
            }
            else
            {
                _local_2.x = -130;
                updateVisuals();
                _local_3 = new EaseOut(new MoveTo(_local_2, 100, 1, _local_2.y), 1);
            };
            _SafeStr_3336.runMotion(_local_3);
        }

        private function motionComplete(_arg_1:Motion):void
        {
            updateVisuals();
        }

        private function updateVisuals():void
        {
            if (((!(_window)) || (!(_window.findChildByName("window_bg")))))
            {
                return;
            };
            _window.findChildByName("window_bg").visible = (!(_SafeStr_6103));
            _window.findChildByName("side_bar_collapse").visible = (!(_SafeStr_6103));
            _window.findChildByName("side_bar_expand").visible = _SafeStr_6103;
            updatePosition();
        }

        private function onWindowEvent(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            var event = _arg_1;
            var target = _arg_2;
            if (((((event.type == "WE_PARENT_RESIZED") && (_window)) && (_window.parent)) && (event.target == _window.parent)))
            {
                return (updatePosition());
            };
            switch (event.type)
            {
                case "WME_CLICK":
                    clearCollapseTimer();
                    switch (target.name)
                    {
                        case "button_settings":
                            handler.toggleRoomInfoWindow();
                            break;
                        case "button_zoom":
                            if (_SafeStr_4981.messageListener)
                            {
                                var message:RoomWidgetZoomToggleMessage = new RoomWidgetZoomToggleMessage();
                                _SafeStr_4981.messageListener.processWidgetMessage(message);
                            };
                            break;
                        case "button_collapse":
                        case "button_expand":
                            _SafeStr_4981.setCollapsed((!(_SafeStr_6103)));
                            handler.sessionDataManager.setRoomToolsState((!(_SafeStr_6103)));
                            break;
                        case "button_history_back":
                            _SafeStr_4981.goToPreviousRoom();
                            break;
                        case "button_history_forward":
                            _SafeStr_4981.goToNextRoom();
                            break;
                        case "button_history":
                            toggleHistory();
                            break;
                        case "button_chat_history":
                            if (_SafeStr_4981.freeFlowChat)
                            {
                                _SafeStr_4981.freeFlowChat.toggleVisibility();
                            };
                            break;
                        case "button_like":
                            handler.rateRoom();
                            _window.findChildByName("button_like").disable();
                            break;
                        case "button_share":
                            var link:String = getEmbedData();
                            var window:_SafeStr_3133 = (_SafeStr_4981.windowManager.getWindowByName("share_room_link") as _SafeStr_3133);
                            if (window == null)
                            {
                                var asset:XML = (_assets.getAssetByName("share_room_xml").content as XML);
                                if (asset)
                                {
                                    window = (_SafeStr_4981.windowManager.buildFromXML(asset) as _SafeStr_3133);
                                };
                            };
                            if (window)
                            {
                                HabboTracking.getInstance().trackEventLog("RoomLink", "click", "client.room_link.clicked");
                                window.name = "share_room_link";
                                window.center();
                                window.findChildByTag("close").addEventListener("WME_CLICK", function (_arg_1:WindowMouseEvent, _arg_2:_SafeStr_3109=null):void
                                {
                                    window.dispose();
                                });
                                window.findChildByName("embed_src_txt").caption = getEmbedData();
                                window.findChildByName("embed_src_direct_txt").caption = getEmbedData("embed_src_direct_txt", "${url.prefix}/room/%roomId%");
                                IStaticBitmapWrapperWindow(window.findChildByName("thumbnail_image")).assetUri = getThumbnailUrl();
                            };
                            try
                            {
                                System.setClipboard(getEmbedData());
                            }
                            catch(error:Error)
                            {
                            };
                            break;
                        case "button_camera":
                            var openCameraEvent:HabboToolbarEvent = new HabboToolbarEvent("HTE_ICON_CAMERA");
                            openCameraEvent.iconName = "roomToolsMenu";
                            handler.container.toolbar.events.dispatchEvent(openCameraEvent);
                    };
                    return;
            };
        }

        private function getEmbedData(_arg_1:String="navigator.embed.src", _arg_2:String=""):String
        {
            var _local_4:* = null;
            var _local_5:* = null;
            if (_SafeStr_4981.handler.navigator.enteredGuestRoomData != null)
            {
                _local_4 = "private";
                _local_5 = ("" + _SafeStr_4981.handler.navigator.enteredGuestRoomData.flatId);
            };
            var _local_3:String = _SafeStr_4981.handler.container.config.getProperty("user.hash");
            if (_SafeStr_4981.localizations.hasLocalization(_arg_1))
            {
                _SafeStr_4981.localizations.registerParameter(_arg_1, "roomType", _local_4);
                _SafeStr_4981.localizations.registerParameter(_arg_1, "embedCode", _local_3);
                _SafeStr_4981.localizations.registerParameter(_arg_1, "roomId", _local_5);
            }
            else
            {
                if (_arg_2 != "")
                {
                    _arg_2 = _arg_2.replace("${url.prefix}", _SafeStr_4981.handler.container.config.getProperty("url.prefix"));
                    return (_arg_2.replace("%roomId%", _local_5));
                };
            };
            return (_SafeStr_4981.localizations.getLocalization(_arg_1, _arg_2));
        }

        private function getThumbnailUrl():String
        {
            var _local_1:* = null;
            var _local_2:String = "";
            if (_SafeStr_4981.handler.navigator.enteredGuestRoomData.officialRoomPicRef != null)
            {
                if (_SafeStr_4981.handler.container.config.getBoolean("new.navigator.official.room.thumbnails.in.amazon"))
                {
                    _local_1 = _SafeStr_4981.handler.container.config.getProperty("navigator.thumbnail.url_base");
                    _local_2 = ((_local_1 + _SafeStr_4981.handler.navigator.enteredGuestRoomData.flatId) + ".png");
                }
                else
                {
                    _local_2 = (_SafeStr_4981.handler.container.config.getProperty("image.library.url") + _SafeStr_4981.handler.navigator.enteredGuestRoomData.officialRoomPicRef);
                };
            }
            else
            {
                _local_1 = _SafeStr_4981.handler.container.config.getProperty("navigator.thumbnail.url_base");
                _local_2 = ((_local_1 + _SafeStr_4981.handler.navigator.enteredGuestRoomData.flatId) + ".png");
            };
            return (_local_2);
        }

        public function get right():int
        {
            var _local_1:* = null;
            if (!_window)
            {
                return (0);
            };
            if (_SafeStr_6103)
            {
                _local_1 = _window.findChildByName("side_bar_expand");
                return ((_local_1) ? (_local_1.width + -5) : 0);
            };
            return (_window.width + -5);
        }


    }
}//package com.sulake.habbo.ui.widget.roomtools

// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3336 = "_-TU" (String#3431, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_6103 = "_-A1f" (String#3645, DoABC#4)
// _SafeStr_6307 = "_-uZ" (String#4789, DoABC#4)


