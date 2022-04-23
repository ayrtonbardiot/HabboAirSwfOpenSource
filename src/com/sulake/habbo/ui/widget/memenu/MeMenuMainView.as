﻿// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.memenu.MeMenuMainView

package com.sulake.habbo.ui.widget.memenu
{
    import com.sulake.core.window._SafeStr_3133;
    import flash.utils.Dictionary;
    import _-111._SafeStr_779;
    import com.sulake.core.runtime._SafeStr_19;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components._SafeStr_3264;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.display.BitmapData;
    import flash.geom.Point;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetDanceMessage;
    import com.sulake.habbo.ui.widget.enums.AvatarExpressionEnum;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetAvatarExpressionMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetRequestWidgetMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetShowOwnRoomsMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetOpenInventoryMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetAvatarEditorMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetOpenCatalogMessage;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetOpenProfileMessage;
    import _-f1P._SafeStr_953;
    import com.sulake.habbo.tracking.HabboTracking;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.window.utils._SafeStr_3114;
    import com.sulake.core.window.events._SafeStr_3116;
    import _-f1y._SafeStr_1356;

    public class MeMenuMainView implements IMeMenuView 
    {

        public static const VIEW_ELEMENT_TYPE_MINI_MAIL:String = "minimail";

        private var _SafeStr_4981:MeMenuWidget;
        private var _window:_SafeStr_3133;
        private var _icons:Dictionary;
        private var _perkAllowancesMessageEvent:_SafeStr_779;
        private var _config:_SafeStr_19;

        public function MeMenuMainView(_arg_1:_SafeStr_19)
        {
            _config = _arg_1;
        }

        public function init(_arg_1:MeMenuWidget, _arg_2:String):void
        {
            _icons = new Dictionary();
            _icons["rooms_icon"] = ["gohome_white", "gohome_color"];
            _icons["dance_icon"] = ["dance_white", "dance_color"];
            _icons["clothes_icon"] = ["clothes_white", "clothes_color"];
            _icons["effects_icon"] = ["effects_white", "effects_color"];
            _icons["badges_icon"] = ["badges_white", "badges_color"];
            _icons["wave_icon"] = ["wave_white", "wave_color"];
            _icons["hc_icon"] = ["_white", "_color"];
            _icons["settings_icon"] = ["settings_white", "settings_color"];
            _icons["credits_icon"] = ["credits_white", "credits_color"];
            _icons["minimail_icon"] = ["minimail_white", "minimail_color"];
            _icons["profile_icon"] = ["profile_white", "profile_color"];
            _icons["achievements_icon"] = ["achievements_white", "achievements_color"];
            _icons["talents_icon"] = ["compass_white", "compass_color"];
            _icons["guide_icon"] = ["lighthouse_white", "lighthouse_color"];
            _SafeStr_4981 = _arg_1;
            _perkAllowancesMessageEvent = new _SafeStr_779(onPerkAllowances);
            _SafeStr_4981.handler.container.connection.addMessageEvent(_perkAllowancesMessageEvent);
            createWindow(_arg_2);
        }

        public function dispose():void
        {
            if (_perkAllowancesMessageEvent)
            {
                _SafeStr_4981.handler.container.connection.removeMessageEvent(_perkAllowancesMessageEvent);
                _perkAllowancesMessageEvent = null;
            };
            _SafeStr_4981 = null;
            if (_window)
            {
                _window.dispose();
                _window = null;
            };
        }

        public function get window():_SafeStr_3133
        {
            return (_window);
        }

        public function setIconAssets(_arg_1:String, _arg_2:String, _arg_3:String=null, _arg_4:String=null):void
        {
            if (_icons[_arg_1] == null)
            {
                return;
            };
            if (_arg_3 != null)
            {
                _icons[_arg_1][0] = _arg_3;
            };
            if (_arg_4 != null)
            {
                _icons[_arg_1][1] = _arg_4;
            };
            setElementImage(_arg_1, _arg_3);
        }

        private function createWindow(_arg_1:String):void
        {
            var _local_12:* = null;
            var _local_7:* = null;
            var _local_3:Number;
            var _local_9:* = null;
            var _local_8:int;
            var _local_2:* = null;
            var _local_10:int;
            if (_SafeStr_4981 == null)
            {
                return;
            };
            var _local_5:String = "memenu_main";
            var _local_6:Boolean;
            if (_SafeStr_4981.config.getBoolean("simple.memenu.enabled"))
            {
                _local_5 = (_local_5 + "_simple");
                _local_6 = true;
            };
            var _local_4:XmlAsset = (_SafeStr_4981.assets.getAssetByName(_local_5) as XmlAsset);
            _window = (_SafeStr_4981.windowManager.buildFromXML((_local_4.content as XML)) as _SafeStr_3133);
            if (_window == null)
            {
                throw (new Error("Failed to construct me menu main window from XML!"));
            };
            _window.name = _arg_1;
            if (((!(_SafeStr_4981.config.getBoolean("talent.track.enabled"))) && (_local_6)))
            {
                _window.findChildByName("guide").rectangle = _window.findChildByName("talents").rectangle;
                _window.findChildByName("talents").visible = false;
            };
            if (_SafeStr_4981.config.getBoolean("guides.enabled"))
            {
                setGuideToolVisibility(_SafeStr_4981.handler.container.sessionDataManager.isPerkAllowed("USE_GUIDE_TOOL"));
            };
            for (var _local_11:String in _icons)
            {
                _local_12 = _icons[_local_11];
                if (!((_local_12 == null) || (_local_12.length == 0)))
                {
                    _local_7 = _local_12[0];
                    _local_3 = 1;
                    switch (_local_11)
                    {
                        case "dance_icon":
                        case "wave_icon":
                            if (_SafeStr_4981.hasEffectOn)
                            {
                                _local_3 = 0.5;
                            };
                            break;
                        case "effects_icon":
                            if (_SafeStr_4981.isDancing)
                            {
                                _local_3 = 0.5;
                            };
                            break;
                        case "hc_icon":
                            _local_7 = (getClubAssetNameBase() + _local_7);
                            if (!_SafeStr_4981.isHabboClubActive)
                            {
                                setElementText("hc_text", _SafeStr_4981.localizations.getLocalization("widget.memenu.hc.join"));
                            }
                            else
                            {
                                if (_SafeStr_4981.habboClubLevel == 2)
                                {
                                    _local_9 = "widget.memenu.vip";
                                }
                                else
                                {
                                    _local_9 = "widget.memenu.hc";
                                };
                                if (_SafeStr_4981.habboClubPeriods > 0)
                                {
                                    _local_9 = (_local_9 + ".long");
                                };
                                _SafeStr_4981.localizations.registerParameter(_local_9, "days", _SafeStr_4981.habboClubDays);
                                _SafeStr_4981.localizations.registerParameter(_local_9, "months", _SafeStr_4981.habboClubPeriods);
                                setElementText("hc_text", _SafeStr_4981.localizations.getLocalization(_local_9));
                            };
                            break;
                        case "minimail_icon":
                            if (!_SafeStr_4981.isMinimailEnabled)
                            {
                                _local_3 = 0.5;
                            }
                            else
                            {
                                _local_8 = _SafeStr_4981.unreadMiniMailMessageCount;
                                if (((_local_8 == -1) || (_local_8 > 0)))
                                {
                                    updateUnseenCounter("minimail", _local_8);
                                };
                            };
                    };
                    setElementImage(_local_11, _local_7, _local_3);
                };
            };
            _local_10 = 0;
            while (_local_10 < _window.numChildren)
            {
                _local_2 = _window.getChildAt(_local_10);
                _local_2.addEventListener("WME_CLICK", onButtonClicked);
                _local_2.addEventListener("WME_OVER", onMouseOverOrOut);
                _local_2.addEventListener("WME_OUT", onMouseOverOrOut);
                _local_10++;
            };
        }

        private function updateUnseenCounter(_arg_1:String, _arg_2:int):void
        {
            var _local_3:_SafeStr_3133 = (_window.findChildByName(_arg_1) as _SafeStr_3133);
            var _local_4:_SafeStr_3133 = (_local_3.findChildByName("unseen_counter") as _SafeStr_3133);
            if (_arg_2 == 0)
            {
                if (_local_4)
                {
                    _local_3.removeChild(_local_4);
                    _local_3.invalidate();
                };
                return;
            };
            if (!_local_4)
            {
                _local_4 = _SafeStr_4981.windowManager.createUnseenItemCounter();
                _local_4.name = "unseen_counter";
                _local_3.addChild(_local_4);
            };
            (_local_4.findChildByName("count") as ITextWindow).text = ((_arg_2 > 0) ? _arg_2.toString() : " ");
            _local_4.x = ((_local_3.width - _local_4.width) - 5);
            _local_4.y = 5;
        }

        private function getClubAssetNameBase():String
        {
            switch (_SafeStr_4981.habboClubLevel)
            {
                case 0:
                case 1:
                    return ("club");
                case 2:
                    return ("vip");
                default:
                    return (null);
            };
        }

        private function setElementImage(_arg_1:String, _arg_2:String, _arg_3:Number=1):void
        {
            var _local_8:_SafeStr_3264 = (_window.findChildByName(_arg_1) as _SafeStr_3264);
            var _local_7:BitmapDataAsset = (_SafeStr_4981.assets.getAssetByName(_arg_2) as BitmapDataAsset);
            if (_local_8 == null)
            {
                _SafeStr_14.log(("Could not find element: " + _arg_1));
                return;
            };
            if (((_local_7 == null) || (_local_7.content == null)))
            {
                _SafeStr_14.log(("Could not find asset: " + _arg_2));
                return;
            };
            var _local_5:BitmapData = (_local_7.content as BitmapData);
            _local_8.bitmap = new BitmapData(_local_8.width, _local_8.height, true, 0);
            var _local_4:int = int(((_local_8.width - _local_5.width) / 2));
            var _local_6:int = int(((_local_8.height - _local_5.height) / 2));
            _local_8.bitmap.copyPixels(_local_5, _local_5.rect, new Point(_local_4, _local_6));
            _local_8.blend = _arg_3;
        }

        private function setElementText(_arg_1:String, _arg_2:String):void
        {
            var _local_3:ITextWindow = (_window.findChildByName(_arg_1) as ITextWindow);
            if (_local_3 != null)
            {
                _local_3.text = _arg_2;
            };
        }

        private function onButtonClicked(_arg_1:WindowMouseEvent):void
        {
            var _local_4:* = null;
            var _local_5:* = null;
            var _local_2:_SafeStr_3109 = (_arg_1.target as _SafeStr_3109);
            var _local_3:String = _local_2.name;
            switch (_local_3)
            {
                case "dance":
                    if (_SafeStr_4981.hasEffectOn)
                    {
                        return;
                    };
                    _SafeStr_4981.changeView("me_menu_dance_moves_view");
                    break;
                case "wave":
                case "blow":
                    if (_SafeStr_4981.hasEffectOn)
                    {
                        return;
                    };
                    if (_SafeStr_4981.isDancing)
                    {
                        _SafeStr_4981.messageListener.processWidgetMessage(new RoomWidgetDanceMessage(0));
                        _SafeStr_4981.isDancing = false;
                    };
                    _local_4 = AvatarExpressionEnum.WAVE;
                    if (_local_3 == "blow")
                    {
                        _local_4 = AvatarExpressionEnum.BLOW;
                    };
                    _SafeStr_4981.messageListener.processWidgetMessage(new RoomWidgetAvatarExpressionMessage(_local_4));
                    _SafeStr_4981.hide();
                    break;
                case "effects":
                    if (_SafeStr_4981.isDancing)
                    {
                        return;
                    };
                    _SafeStr_4981.messageListener.processWidgetMessage(new RoomWidgetRequestWidgetMessage("RWRWM_EFFECTS"));
                    _SafeStr_4981.hide();
                    break;
                case "rooms":
                    _SafeStr_4981.messageListener.processWidgetMessage(new RoomWidgetShowOwnRoomsMessage());
                    _SafeStr_4981.hide();
                    break;
                case "badges":
                    _SafeStr_4981.messageListener.processWidgetMessage(new RoomWidgetOpenInventoryMessage("inventory_badges"));
                    _SafeStr_4981.hide();
                    break;
                case "clothes":
                    _SafeStr_4981.messageListener.processWidgetMessage(new RoomWidgetAvatarEditorMessage("RWCM_OPEN_AVATAR_EDITOR"));
                    _SafeStr_4981.hide();
                    break;
                case "hc":
                    _SafeStr_4981.messageListener.processWidgetMessage(new RoomWidgetOpenCatalogMessage("RWOCM_CLUB_MAIN"));
                    _SafeStr_4981.hide();
                    break;
                case "settings":
                    _SafeStr_4981.changeView("me_menu_settings_view");
                    break;
                case "minimail":
                    if (_SafeStr_4981.isMinimailEnabled)
                    {
                        HabboWebTools.openMinimail("#mail/inbox/");
                        _SafeStr_4981.hide();
                    };
                    break;
                case "credits":
                    HabboWebTools.openWebPageAndMinimizeClient(_config.getProperty("web.shop.relativeUrl"));
                    _SafeStr_4981.hide();
                    break;
                case "profile":
                    _SafeStr_4981.messageListener.processWidgetMessage(new RoomWidgetOpenProfileMessage("RWOPEM_OPEN_USER_PROFILE", _SafeStr_4981.userId, "me_menu"));
                    _SafeStr_4981.hide();
                    break;
                case "achievements":
                    _SafeStr_4981.handler.container.questEngine.showAchievements();
                    _SafeStr_4981.hide();
                    break;
                case "guide":
                    _SafeStr_4981.handler.container.toolbar.toggleWindowVisibility("GUIDE");
                    _SafeStr_4981.hide();
                    break;
                case "talents":
                    _local_5 = _SafeStr_4981.handler.container.sessionDataManager.currentTalentTrack;
                    _SafeStr_4981.handler.container.habboTracking.trackTalentTrackOpen(_local_5, "memenu");
                    _SafeStr_4981.handler.container.connection.send(new _SafeStr_953(_local_5));
                    break;
                default:
                    _SafeStr_14.log(("Me Menu Main View: unknown button: " + _local_3));
            };
            HabboTracking.getInstance().trackEventLog("MeMenu", "click", _local_3);
        }

        private function onAlertClicked(_arg_1:_SafeStr_3114, _arg_2:_SafeStr_3116):void
        {
            _arg_1.dispose();
        }

        private function onMouseOverOrOut(_arg_1:WindowMouseEvent):void
        {
            var _local_8:* = null;
            var _local_5:* = null;
            var _local_2:_SafeStr_3109 = (_arg_1.target as _SafeStr_3109);
            var _local_4:String = _local_2.name;
            var _local_7:String = (_local_4 + "_icon");
            var _local_6:String = "";
            var _local_3:int = ((_arg_1.type == "WME_OVER") ? 1 : 0);
            switch (_local_4)
            {
                case "dance":
                    if (_SafeStr_4981.hasEffectOn)
                    {
                        return;
                    };
                    break;
                case "minimail":
                    if (!_SafeStr_4981.isMinimailEnabled)
                    {
                        return;
                    };
                    break;
                case "wave":
                    if (_SafeStr_4981.hasEffectOn)
                    {
                        return;
                    };
                    break;
                case "effects":
                    if (_SafeStr_4981.isDancing)
                    {
                        return;
                    };
                    break;
                case "hc":
                    _local_6 = getClubAssetNameBase();
            };
            _local_7 = (_local_4 + "_icon");
            _local_8 = _icons[_local_7];
            if (_local_8 != null)
            {
                _local_5 = (_local_6 + _local_8[_local_3]);
                setElementImage(_local_7, _local_5);
            };
        }

        private function onPerkAllowances(_arg_1:_SafeStr_779):void
        {
            var _local_2:_SafeStr_1356 = _arg_1.getParser();
            setGuideToolVisibility(_local_2.isPerkAllowed("USE_GUIDE_TOOL"));
        }

        private function setGuideToolVisibility(_arg_1:Boolean):void
        {
            var _local_3:* = null;
            var _local_2:* = null;
            if (((_window) && (_SafeStr_4981)))
            {
                _local_3 = _window.findChildByName("guide");
                _local_2 = _window.findChildByName("achievements");
                if (_local_3)
                {
                    _local_3.visible = _arg_1;
                    _window.height = ((_arg_1) ? _local_3.bottom : _local_2.bottom);
                    _SafeStr_4981.updateSize();
                };
            };
        }

        public function updateUnseenItemCount(_arg_1:String, _arg_2:int):void
        {
            var _local_3:int;
            switch (_arg_1)
            {
                case "minimail":
                    _local_3 = _SafeStr_4981.unreadMiniMailMessageCount;
                    updateUnseenCounter("minimail", _local_3);
                    return;
            };
        }


    }
}//package com.sulake.habbo.ui.widget.memenu

// _SafeStr_1356 = "_-dY" (String#23886, DoABC#4)
// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_19 = "_-01r" (String#1323, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3114 = "_-b1E" (String#1258, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_779 = "_-s1X" (String#3814, DoABC#4)
// _SafeStr_953 = "_-a1w" (String#3282, DoABC#4)


