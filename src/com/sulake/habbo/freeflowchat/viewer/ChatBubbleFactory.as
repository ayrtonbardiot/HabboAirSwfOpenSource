﻿// by nota

//com.sulake.habbo.freeflowchat.viewer.ChatBubbleFactory

package com.sulake.habbo.freeflowchat.viewer
{
    import com.sulake.habbo.room._SafeStr_3140;
    import com.sulake.habbo.avatar._SafeStr_1875;
    import com.sulake.habbo.freeflowchat.HabboFreeFlowChat;
    import com.sulake.habbo.freeflowchat.viewer.visualization.style.ChatStyleLibrary;
    import com.sulake.core.utils._SafeStr_24;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.freeflowchat.viewer.visualization.PooledChatBubble;
    import com.sulake.habbo.freeflowchat.viewer.visualization.style.ChatStyle;
    import com.sulake.habbo.session._SafeStr_3241;
    import flash.display.BitmapData;
    import com.sulake.habbo.freeflowchat.viewer.enum.ChatColours;
    import com.sulake.habbo.freeflowchat.data.ChatItem;
    import com.sulake.habbo.freeflowchat.viewer.simulation.BlankStyle;
    import com.sulake.habbo.freeflowchat.viewer.visualization.style._SafeStr_3335;
    import com.sulake.habbo.session.events.RoomSessionChatEvent;
    import flash.utils.getTimer;
    import com.sulake.habbo.freeflowchat.viewer.visualization.ChatBubble;
    import com.sulake.habbo.freeflowchat.history.visualization.entry.ChatHistoryEntryBitmapBubble;
    import com.sulake.habbo.freeflowchat.history.visualization.entry._SafeStr_3280;
    import com.sulake.habbo.freeflowchat.history.visualization.entry.ChatHistoryRoomChangeEntry;
    import _-Ja._SafeStr_1569;
    import com.sulake.habbo.avatar.pets.PetFigureData;
    import com.sulake.room.utils.Vector3d;

    public class ChatBubbleFactory implements _SafeStr_3140, _SafeStr_1875 
    {

        private static const MAX_DISPOSABLE_BITMAPS:int = 30;

        private var _SafeStr_4147:HabboFreeFlowChat;
        private var _SafeStr_5002:ChatStyleLibrary;
        private var _avatarImageCache:_SafeStr_24 = new _SafeStr_24();
        private var _petImageCache:_SafeStr_24 = new _SafeStr_24();
        private var _avatarColorCache:_SafeStr_24 = new _SafeStr_24();
        private var _petImageIdToFigureString:_SafeStr_24 = new _SafeStr_24();
        private var _SafeStr_5005:Array = [];
        private var _SafeStr_5003:Vector.<PooledChatBubble> = new Vector.<PooledChatBubble>(0);
        private var _SafeStr_5004:int;

        public function ChatBubbleFactory(_arg_1:HabboFreeFlowChat)
        {
            _SafeStr_4147 = _arg_1;
            _SafeStr_5002 = new ChatStyleLibrary(_SafeStr_4147.assets);
            _SafeStr_5004 = _SafeStr_4147.sessionDataManager.userId;
        }

        public function dispose():void
        {
            discardOldBitmaps();
            _SafeStr_5005 = [];
            _SafeStr_5002.dispose();
            _SafeStr_5002 = null;
            _SafeStr_4147 = null;
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_4147 == null);
        }

        public function getNewChatBubble(_arg_1:ChatItem, _arg_2:Boolean=false):PooledChatBubble
        {
            var _local_11:* = null;
            var _local_16:* = null;
            var _local_6:* = null;
            var _local_20:Boolean;
            var _local_9:int;
            var _local_21:int;
            var _local_10:* = null;
            var _local_13:* = null;
            var _local_8:* = null;
            var _local_15:* = null;
            var _local_7:* = null;
            var _local_3:* = null;
            var _local_17:* = null;
            var _local_19:ChatStyle = ChatStyle(_SafeStr_5002.getStyle(_arg_1.style));
            var _local_4:_SafeStr_3241 = _SafeStr_4147.roomSessionManager.getSession(_arg_1.roomId).userDataManager.getUserDataByIndex(_arg_1.userId);
            var _local_12:String = "";
            var _local_18:uint;
            var _local_5:BitmapData = _local_19.iconImage;
            if (((_arg_1.forcedFigure) || (_arg_1.forcedUserName)))
            {
                if (!_local_5)
                {
                    _local_5 = getUserImage(_arg_1.forcedFigure);
                };
                _local_12 = _arg_1.forcedUserName;
            }
            else
            {
                if (_local_4 != null)
                {
                    _local_12 = _local_4.name;
                    _local_11 = _local_4.figure;
                    _local_18 = _avatarColorCache.getValue(_local_11);
                    if (!_local_5)
                    {
                        switch (_local_4.type)
                        {
                            case 2:
                                _local_16 = _SafeStr_4147.roomEngine.getRoomObject(_arg_1.roomId, _local_4.roomObjectId, 100);
                                _local_6 = null;
                                if (_local_16 != null)
                                {
                                    _local_6 = _local_16.getModel().getString("figure_posture");
                                };
                                _local_20 = true;
                                _local_9 = 32;
                                _local_21 = 2;
                                _local_5 = getPetImage(_local_11, _local_21, _local_20, _local_9, _local_6);
                                break;
                            case 1:
                                _local_5 = getUserImage(_local_11);
                            default:
                        };
                    };
                };
            };
            if (_arg_1.chatType == 3)
            {
                _arg_1.text = ((_SafeStr_4147.localizations) ? _SafeStr_4147.localizations.getLocalizationWithParams("widgets.chatbubble.respect", "", "username", _local_12) : "");
            }
            else
            {
                if (_arg_1.chatType == 4)
                {
                    _arg_1.text = ((_SafeStr_4147.localizations) ? _SafeStr_4147.localizations.getLocalizationWithParams("widget.chatbubble.petrespect", "", "petname", _local_12) : "");
                }
                else
                {
                    if (_arg_1.chatType == 6)
                    {
                        _arg_1.text = ((_SafeStr_4147.localizations) ? _SafeStr_4147.localizations.getLocalizationWithParams("widget.chatbubble.pettreat", "", "petname", _local_12) : "");
                    };
                };
            };
            if (_arg_1.chatType == 5)
            {
                _local_10 = "widget.chatbubble.handitem";
                _local_13 = _SafeStr_4147.localizations.getLocalization(("handitem" + _arg_1.extraParam), ("handitem" + _arg_1.extraParam));
                _SafeStr_4147.localizations.registerParameter(_local_10, "username", _local_12);
                _SafeStr_4147.localizations.registerParameter(_local_10, "handitem", _local_13);
                _arg_1.text = _SafeStr_4147.localizations.getLocalizationRaw(_local_10).value;
            };
            if (_arg_1.chatType == 10)
            {
                _local_8 = "widget.chatbubble.mutetime";
                _local_15 = String((_arg_1.extraParam % 60));
                _local_7 = String(((_arg_1.extraParam > 0) ? Math.floor(((_arg_1.extraParam % 3600) / 60)) : 0));
                _local_3 = String(((_arg_1.extraParam > 0) ? Math.floor((_arg_1.extraParam / 3600)) : 0));
                _SafeStr_4147.localizations.registerParameter(_local_8, "hours", _local_3);
                _SafeStr_4147.localizations.registerParameter(_local_8, "minutes", _local_7);
                _SafeStr_4147.localizations.registerParameter(_local_8, "seconds", _local_15);
                _arg_1.text = _SafeStr_4147.localizations.getLocalizationRaw(_local_8).value;
            };
            if (_SafeStr_5003.length > 0)
            {
                _local_17 = _SafeStr_5003.pop();
            }
            else
            {
                _local_17 = new PooledChatBubble(_SafeStr_4147);
            };
            filterHtml(_arg_1, _local_19);
            var _local_14:Object = _local_19.textFormat.color;
            ChatColours.applyColourToChat(_arg_1, _local_19);
            _local_17.chatItem = _arg_1;
            _local_17.style = _local_19;
            _local_17.face = _local_5;
            _local_17.recreate(_local_12, ((_arg_1.forcedColor) ? _arg_1.forcedColor : _local_18), _SafeStr_4147.roomChatBorderLimited);
            _local_19.textFormat.color = _local_14;
            return (_local_17);
        }

        public function getNewEmptySpace(_arg_1:int):PooledChatBubble
        {
            var _local_4:* = null;
            var _local_5:_SafeStr_3335 = new BlankStyle();
            var _local_2:RoomSessionChatEvent = new RoomSessionChatEvent("RSCE_CHAT_EVENT", null, -1, "", 1);
            var _local_3:ChatItem = new ChatItem(_local_2, getTimer());
            if (_SafeStr_5003.length > 0)
            {
                _local_4 = _SafeStr_5003.pop();
            }
            else
            {
                _local_4 = new PooledChatBubble(_SafeStr_4147);
            };
            _local_4.chatItem = _local_3;
            _local_4.style = _local_5;
            _local_4.face = null;
            _local_4.recreate("", 0, false, 19);
            return (_local_4);
        }

        public function getHistoryLineEntry(_arg_1:ChatItem):_SafeStr_3280
        {
            var _local_11:* = null;
            var _local_15:* = null;
            var _local_6:* = null;
            var _local_20:Boolean;
            var _local_9:int;
            var _local_21:int;
            var _local_10:* = null;
            var _local_13:* = null;
            var _local_8:* = null;
            var _local_14:* = null;
            var _local_7:* = null;
            var _local_2:* = null;
            var _local_19:ChatStyle = ChatStyle(_SafeStr_5002.getStyle(_arg_1.style));
            var _local_3:_SafeStr_3241 = _SafeStr_4147.roomSessionManager.getSession(_arg_1.roomId).userDataManager.getUserDataByIndex(_arg_1.userId);
            var _local_12:String = "";
            var _local_18:uint;
            var _local_4:BitmapData = _local_19.iconImage;
            var _local_5:* = (!((_local_3 == null) || (_local_3.webID == _SafeStr_5004)));
            if (((_arg_1.forcedFigure) || (_arg_1.forcedUserName)))
            {
                if (!_local_4)
                {
                    _local_4 = getUserImage(_arg_1.forcedFigure);
                };
                _local_12 = _arg_1.forcedUserName;
            }
            else
            {
                if (_local_3 != null)
                {
                    _local_12 = _local_3.name;
                    _local_11 = _local_3.figure;
                    _local_18 = _avatarColorCache.getValue(_local_11);
                    if (!_local_4)
                    {
                        switch (_local_3.type)
                        {
                            case 2:
                                _local_15 = _SafeStr_4147.roomEngine.getRoomObject(_arg_1.roomId, _local_3.roomObjectId, 100);
                                _local_6 = null;
                                if (_local_15 != null)
                                {
                                    _local_6 = _local_15.getModel().getString("figure_posture");
                                };
                                _local_20 = false;
                                _local_9 = 32;
                                _local_21 = 2;
                                _local_4 = getPetImage(_local_11, _local_21, _local_20, _local_9, _local_6);
                                break;
                            case 1:
                            case 3:
                            case 4:
                                _local_4 = getUserImage(_local_11);
                            default:
                        };
                    };
                };
            };
            if (_arg_1.chatType == 3)
            {
                _arg_1.text = ((_SafeStr_4147.localizations) ? "" : _SafeStr_4147.localizations.getLocalizationWithParams("widgets.chatbubble.respect", "", "username", _local_12));
                _local_5 = false;
            }
            else
            {
                if (_arg_1.chatType == 4)
                {
                    _arg_1.text = ((_SafeStr_4147.localizations) ? "" : _SafeStr_4147.localizations.getLocalizationWithParams("widget.chatbubble.petrespect", "", "petname", _local_12));
                    _local_5 = false;
                }
                else
                {
                    if (_arg_1.chatType == 6)
                    {
                        _arg_1.text = ((_SafeStr_4147.localizations) ? "" : _SafeStr_4147.localizations.getLocalizationWithParams("widget.chatbubble.pettreat", "", "petname", _local_12));
                        _local_5 = false;
                    };
                };
            };
            if (_arg_1.chatType == 5)
            {
                _local_10 = "widget.chatbubble.handitem";
                _local_13 = _SafeStr_4147.localizations.getLocalizationWithParams(("handitem" + _arg_1.extraParam), ("handitem" + _arg_1.extraParam));
                _arg_1.text = _SafeStr_4147.localizations.getLocalizationWithParams(_local_10, "", "username", _local_12, "handitem", _local_13);
                _local_5 = false;
            };
            if (_arg_1.chatType == 10)
            {
                _local_8 = "widget.chatbubble.mutetime";
                _local_14 = String((_arg_1.extraParam % 60));
                _local_7 = String(((_arg_1.extraParam > 0) ? Math.floor(((_arg_1.extraParam % 3600) / 60)) : 0));
                _local_2 = String(((_arg_1.extraParam > 0) ? Math.floor((_arg_1.extraParam / 3600)) : 0));
                _SafeStr_4147.localizations.registerParameter(_local_8, "hours", _local_2);
                _SafeStr_4147.localizations.registerParameter(_local_8, "minutes", _local_7);
                _SafeStr_4147.localizations.registerParameter(_local_8, "seconds", _local_14);
                _arg_1.text = _SafeStr_4147.localizations.getLocalizationRaw(_local_8).value;
                _local_5 = false;
            };
            filterHtml(_arg_1, _local_19);
            var _local_16:ChatBubble = new ChatBubble(_arg_1, _local_19, _local_4, _local_12, ((_arg_1.forcedColor) ? _arg_1.forcedColor : _local_18), _SafeStr_4147, 1);
            var _local_17:BitmapData = new BitmapData(_local_16.width, _local_16.height, true, 0);
            _local_16.drawToBitmap(_local_17);
            return (new ChatHistoryEntryBitmapBubble(_arg_1, _local_5, _local_12, _local_17, _local_19.overlap));
        }

        private function filterHtml(_arg_1:ChatItem, _arg_2:ChatStyle):void
        {
            if (!_arg_2.allowHTML)
            {
                _arg_1.text = _arg_1.text.replace(/</g, "&lt;").replace(/>/g, "&gt;");
                _arg_1.text = _arg_1.text.replace(/&#[0-9]+;/g, "");
                _arg_1.text = _arg_1.text.replace(/&#x[0-9]+;/g, "");
            };
        }

        public function getHistoryRoomChangeEntry(_arg_1:_SafeStr_1569):_SafeStr_3280
        {
            return (new ChatHistoryRoomChangeEntry(_arg_1, _SafeStr_4147));
        }

        public function recycle(_arg_1:PooledChatBubble):void
        {
            _SafeStr_5003.push(_arg_1);
        }

        public function getUserImage(_arg_1:String):BitmapData
        {
            var _local_5:* = null;
            var _local_4:* = null;
            var _local_3:Boolean = _SafeStr_4147.getBoolean("zoom.enabled");
            var _local_2:BitmapData = (_avatarImageCache.getValue(_arg_1) as BitmapData);
            if (_local_2 == null)
            {
                _local_5 = _SafeStr_4147.avatarRenderManager.createAvatarImage(_arg_1, ((_local_3) ? "h" : "sh"), null, this);
                if (_local_5 != null)
                {
                    _local_2 = _local_5.getCroppedImage("head", ((_local_3) ? 0.5 : 1));
                    _local_4 = _local_5.getPartColor("ch");
                    _local_5.dispose();
                    if (_local_4 != null)
                    {
                        _avatarColorCache.add(_arg_1, _local_4.rgb);
                    };
                };
            };
            if (_local_2 != null)
            {
                _avatarImageCache.add(_arg_1, _local_2);
            };
            return (_local_2);
        }

        private function getPetImage(_arg_1:String, _arg_2:int, _arg_3:Boolean, _arg_4:int=64, _arg_5:String=null):BitmapData
        {
            var _local_6:* = null;
            var _local_8:int;
            var _local_7:uint;
            var _local_11:Boolean;
            var _local_9:* = null;
            var _local_10:BitmapData = (_petImageCache.getValue((_arg_1 + _arg_5)) as BitmapData);
            if (_local_10 == null)
            {
                _local_6 = new PetFigureData(_arg_1);
                _local_8 = _local_6.typeId;
                _local_7 = 0;
                _local_11 = false;
                if (35 == _local_8)
                {
                    _local_11 = true;
                };
                _local_9 = _SafeStr_4147.roomEngine.getPetImage(_local_8, _local_6.paletteId, _local_6.color, new Vector3d((_arg_2 * 45)), _arg_4, this, _local_11, _local_7, _local_6.customParts, _arg_5);
                if (_local_9 != null)
                {
                    _local_10 = _local_9.data;
                    if (_local_9.id > 0)
                    {
                        _petImageIdToFigureString.add(_local_9.id, _local_6.figureString);
                    };
                };
                _avatarColorCache.add(_arg_1, _local_6.color);
            };
            if (_local_10 != null)
            {
                _petImageCache.add((_arg_1 + _arg_5), _local_10);
            };
            return (_local_10);
        }

        public function imageReady(_arg_1:int, _arg_2:BitmapData):void
        {
            var _local_3:String = _petImageIdToFigureString.remove(_arg_1);
            if (_local_3 != null)
            {
                petImageReady(_local_3);
                if (_petImageCache)
                {
                    _petImageCache.add(_local_3, _arg_2);
                };
            };
        }

        public function imageFailed(_arg_1:int):void
        {
        }

        private function petImageReady(_arg_1:String):void
        {
            var _local_2:* = null;
            if (_petImageCache)
            {
                _local_2 = (_petImageCache.remove(_arg_1) as BitmapData);
                if (_local_2 != null)
                {
                    _SafeStr_5005.push(_local_2);
                };
            };
            if (_SafeStr_5005.length > 30)
            {
                discardOldBitmaps();
            };
        }

        public function avatarImageReady(_arg_1:String):void
        {
            var _local_2:* = null;
            if (_avatarImageCache)
            {
                _local_2 = (_avatarImageCache.remove(_arg_1) as BitmapData);
                if (_local_2 != null)
                {
                    _SafeStr_5005.push(_local_2);
                };
            };
            if (_SafeStr_5005.length > 30)
            {
                discardOldBitmaps();
            };
        }

        private function discardOldBitmaps():void
        {
            for each (var _local_1:BitmapData in _SafeStr_5005)
            {
                if (_local_1 != null)
                {
                    _local_1.dispose();
                };
            };
        }

        public function get chatStyleLibrary():ChatStyleLibrary
        {
            return (_SafeStr_5002);
        }


    }
}//package com.sulake.habbo.freeflowchat.viewer

// _SafeStr_1569 = "_-R1p" (String#1360, DoABC#4)
// _SafeStr_1875 = "_-R1S" (String#2190, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3138 = "_-L1S" (String#1270, DoABC#4)
// _SafeStr_3140 = "_-Y1o" (String#1299, DoABC#4)
// _SafeStr_3241 = "_-O1A" (String#764, DoABC#4)
// _SafeStr_3248 = "_-u1i" (String#807, DoABC#4)
// _SafeStr_3280 = "_-mJ" (String#4458, DoABC#4)
// _SafeStr_3335 = "_-sO" (String#7785, DoABC#4)
// _SafeStr_4147 = "_-Q1a" (String#196, DoABC#4)
// _SafeStr_5002 = "_-xg" (String#8722, DoABC#4)
// _SafeStr_5003 = "_-Zm" (String#10140, DoABC#4)
// _SafeStr_5004 = "_-pZ" (String#17889, DoABC#4)
// _SafeStr_5005 = "_-Ly" (String#4247, DoABC#4)


