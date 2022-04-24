// by nota

//com.sulake.habbo.ui.widget.memenu.MeMenuWidget

package com.sulake.habbo.ui.widget.memenu
{
    import com.sulake.habbo.ui.widget.RoomWidgetBase;
    import flash.geom.Point;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.runtime._SafeStr_19;
    import flash.external.ExternalInterface;
    import com.sulake.habbo.ui.handler.MeMenuWidgetHandler;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.habbo.ui.widget.memenu.soundsettings.MeMenuSoundSettingsView;
    import com.sulake.habbo.ui.widget.memenu.chatsettings.MeMenuChatSettingsView;
    import flash.events.IEventDispatcher;
    import com.sulake.habbo.ui.widget.events.RoomWidgetRoomObjectUpdateEvent;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUserInfoUpdateEvent;
    import com.sulake.habbo.ui.widget.events.RoomWidgetSettingsUpdateEvent;
    import com.sulake.habbo.ui.widget.events.RoomWidgetTutorialEvent;
    import com.sulake.habbo.utils.WindowToggle;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMeMenuMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetToolbarClickedUpdateEvent;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEffectsUpdateEvent;
    import flash.events.Event;
    import com.sulake.habbo.ui.widget.events.RoomWidgetAvatarEditorUpdateEvent;
    import com.sulake.habbo.ui.widget.events.RoomWidgetWaveUpdateEvent;
    import com.sulake.habbo.ui.widget.events.RoomWidgetMiniMailUpdateEvent;
    import com.sulake.habbo.ui.widget.events.RoomWidgetDanceUpdateEvent;
    import com.sulake.habbo.ui.widget.events.RoomWidgetHabboClubUpdateEvent;
    import com.sulake.habbo.ui.widget.events.RoomWidgetPurseUpdateEvent;
    import com.sulake.habbo.ui.widget.events.RoomWidgetRoomEngineUpdateEvent;

    public class MeMenuWidget extends RoomWidgetBase 
    {

        public static const MAIN_VIEW:String = "me_menu_top_view";
        public static const MY_CLOTHES_VIEW:String = "me_menu_my_clothes_view";
        public static const _SafeStr_9040:String = "me_menu_dance_moves_view";
        public static const _SafeStr_9041:String = "me_menu_settings_view";
        public static const SOUND_SETTINGS_VIEW:String = "me_menu_sound_settings";
        public static const CHAT_SETTINGS_VIEW:String = "me_menu_chat_settings";
        private static const DEFAULT_VIEW_LOCATION_BOTTOM:Point = new Point(95, 440);

        private var _SafeStr_4494:IMeMenuView;
        private var _SafeStr_4079:_SafeStr_3133;
        private var _SafeStr_4496:int = 0;
        private var _SafeStr_4500:int = 0;
        private var _SafeStr_9042:int = 0;
        private var _SafeStr_4499:Boolean = false;
        private var _SafeStr_4497:int = 0;
        private var _SafeStr_4502:Boolean = false;
        private var _SafeStr_4503:Boolean = false;
        private var _SafeStr_4495:Boolean = false;
        private var _SafeStr_4501:Boolean = false;
        private var _SafeStr_4498:int = 0;
        private var _SafeStr_3710:Boolean = false;
        private var _config:_SafeStr_19;
        private var _SafeStr_4128:int;

        public function MeMenuWidget(_arg_1:IRoomWidgetHandler, _arg_2:_SafeStr_1695, _arg_3:_SafeStr_21, _arg_4:_SafeStr_18, _arg_5:_SafeStr_19)
        {
            super(_arg_1, _arg_2, _arg_3, _arg_4);
            _config = _arg_5;
            if (ExternalInterface.available)
            {
                _SafeStr_4501 = _arg_5.getBoolean("client.minimail.embed.enabled");
            };
            (_arg_1 as MeMenuWidgetHandler).widget = this;
            changeView("me_menu_top_view");
            hide();
        }

        override public function dispose():void
        {
            if (disposed)
            {
                return;
            };
            hide();
            if (_SafeStr_4494 != null)
            {
                _SafeStr_4494.dispose();
                _SafeStr_4494 = null;
            };
            _SafeStr_4079 = null;
            _config = null;
            super.dispose();
        }

        public function get handler():MeMenuWidgetHandler
        {
            return (_SafeStr_3914 as MeMenuWidgetHandler);
        }

        override public function get mainWindow():_SafeStr_3109
        {
            return (_SafeStr_4079);
        }

        private function get mainContainer():_SafeStr_3133
        {
            var _local_1:* = null;
            if (_SafeStr_4079 == null)
            {
                _local_1 = _assets.getAssetByName("memenu");
                if (_local_1)
                {
                    _SafeStr_4079 = (windowManager.buildFromXML((_local_1.content as XML)) as _SafeStr_3133);
                };
            };
            if (_SafeStr_4079)
            {
                return (_SafeStr_4079.findChildByTag("MAIN_CONTENT") as _SafeStr_3133);
            };
            return (null);
        }

        public function changeView(_arg_1:String):void
        {
            var _local_2:* = null;
            switch (_arg_1)
            {
                case "me_menu_top_view":
                    _local_2 = new MeMenuMainView(config);
                    break;
                case "me_menu_dance_moves_view":
                    _local_2 = new MeMenuDanceView();
                    break;
                case "me_menu_settings_view":
                    _local_2 = new MeMenuSettingsMenuView();
                    break;
                case "me_menu_sound_settings":
                    _local_2 = new MeMenuSoundSettingsView();
                    break;
                case "me_menu_chat_settings":
                    _local_2 = new MeMenuChatSettingsView();
                    break;
                default:
                    _SafeStr_14.log(("Me Menu Change view: unknown view: " + _arg_1));
            };
            if (_local_2 != null)
            {
                if (_SafeStr_4494)
                {
                    _SafeStr_4494.dispose();
                    _SafeStr_4494 = null;
                };
                _SafeStr_4494 = _local_2;
                _SafeStr_4494.init(this, _arg_1);
                mainContainer.removeChildAt(0);
                mainContainer.addChildAt(_SafeStr_4494.window, 0);
                _SafeStr_4079.visible = true;
                _SafeStr_4079.activate();
            };
            updateSize();
        }

        public function updateSize():void
        {
            var _local_1:int;
            var _local_2:* = null;
            if ((((_SafeStr_4494) && (_SafeStr_4494.window)) && (_SafeStr_4079)))
            {
                _local_1 = 5;
                _SafeStr_4494.window.position = new Point(_local_1, _local_1);
                mainContainer.width = (_SafeStr_4494.window.width + (_local_1 * 2));
                mainContainer.height = (_SafeStr_4494.window.height + (_local_1 * 2));
                if (((((_config.getBoolean("simple.memenu.enabled")) && (handler)) && (handler.container)) && (handler.container.toolbar)))
                {
                    _local_2 = handler.container.toolbar.getRect();
                    _SafeStr_4079.x = (_local_2.right + _local_1);
                    _SafeStr_4079.y = (_local_2.bottom - _SafeStr_4079.height);
                }
                else
                {
                    _SafeStr_4079.x = DEFAULT_VIEW_LOCATION_BOTTOM.x;
                    _SafeStr_4079.y = (DEFAULT_VIEW_LOCATION_BOTTOM.y - mainContainer.height);
                };
            };
        }

        override public function registerUpdateEvents(_arg_1:IEventDispatcher):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            _arg_1.addEventListener("RWMMUE_new_mini_mail", onMiniMailUpdate);
            _arg_1.addEventListener("RWMMUE_unread_mini_mail", onMiniMailUpdate);
            _arg_1.addEventListener("RWUE_WAVE", onWaveEvent);
            _arg_1.addEventListener("RWUE_DANCE", onDanceEvent);
            _arg_1.addEventListener("RWUEUE_UPDATE_EFFECTS", onUpdateEffects);
            _arg_1.addEventListener("RWUE_REQUEST_ME_MENU_TOOLBAR_CLICKED", onToolbarClicked);
            _arg_1.addEventListener("RWUE_AVATAR_EDITOR_CLOSED", onAvatarEditorClosed);
            _arg_1.addEventListener("RWUE_HIDE_AVATAR_EDITOR", onHideAvatarEditor);
            _arg_1.addEventListener("RWROUE_OBJECT_DESELECTED", onAvatarDeselected);
            _arg_1.addEventListener("RWBIUE_HABBO_CLUB", onHabboClubEvent);
            _arg_1.addEventListener("RWUIUE_OWN_USER", onUserInfo);
            _arg_1.addEventListener("RWSUE_SETTINGS", onSettingsUpdate);
            _arg_1.addEventListener("HHTPNUFWE_AE_STARTED", onTutorialEvent);
            _arg_1.addEventListener("HHTPNUFWE_AE_HIGHLIGHT", onTutorialEvent);
            _arg_1.addEventListener("RWPUE_CREDIT_BALANCE", onCreditBalance);
            _arg_1.addEventListener("RWREUE_NORMAL_MODE", onNormalMode);
            _arg_1.addEventListener("RWREUE_GAME_MODE", onGameMode);
            super.registerUpdateEvents(_arg_1);
        }

        override public function unregisterUpdateEvents(_arg_1:IEventDispatcher):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            _arg_1.removeEventListener("RWUE_WAVE", onWaveEvent);
            _arg_1.removeEventListener("RWUE_DANCE", onDanceEvent);
            _arg_1.removeEventListener("RWUEUE_UPDATE_EFFECTS", onUpdateEffects);
            _arg_1.removeEventListener("RWUE_REQUEST_ME_MENU_TOOLBAR_CLICKED", onToolbarClicked);
            _arg_1.removeEventListener("RWROUE_OBJECT_DESELECTED", onAvatarDeselected);
            _arg_1.removeEventListener("RWBIUE_HABBO_CLUB", onHabboClubEvent);
            _arg_1.removeEventListener("RWUE_AVATAR_EDITOR_CLOSED", onHideAvatarEditor);
            _arg_1.removeEventListener("RWUE_HIDE_AVATAR_EDITOR", onAvatarEditorClosed);
            _arg_1.removeEventListener("RWUIUE_OWN_USER", onUserInfo);
            _arg_1.removeEventListener("RWSUE_SETTINGS", onSettingsUpdate);
            _arg_1.removeEventListener("HHTPNUFWE_AE_HIGHLIGHT", onTutorialEvent);
            _arg_1.removeEventListener("HHTPNUFWE_AE_STARTED", onTutorialEvent);
            _arg_1.removeEventListener("RWPUE_CREDIT_BALANCE", onCreditBalance);
            _arg_1.removeEventListener("RWREUE_NORMAL_MODE", onNormalMode);
            _arg_1.removeEventListener("RWREUE_NORMAL_MODE", onGameMode);
        }

        public function hide(_arg_1:RoomWidgetRoomObjectUpdateEvent=null):void
        {
            if (_SafeStr_4494 != null)
            {
                _SafeStr_4079.removeChild(_SafeStr_4494.window);
                _SafeStr_4494.dispose();
                _SafeStr_4494 = null;
            };
            _SafeStr_4079.visible = false;
            _SafeStr_4495 = false;
        }

        private function onUserInfo(_arg_1:RoomWidgetUserInfoUpdateEvent):void
        {
            _SafeStr_4128 = _arg_1.webID;
        }

        private function onSettingsUpdate(_arg_1:RoomWidgetSettingsUpdateEvent):void
        {
            if (!_SafeStr_4495)
            {
                return;
            };
            if (_SafeStr_4494.window.name == "me_menu_sound_settings")
            {
                (_SafeStr_4494 as MeMenuSoundSettingsView).updateSettings(_arg_1);
            };
        }

        private function onTutorialEvent(_arg_1:RoomWidgetTutorialEvent):void
        {
            switch (_arg_1.type)
            {
                case "HHTPNUFWE_AE_HIGHLIGHT":
                    _SafeStr_14.log(((("* MeMenuWidget: onHighlightClothesIcon " + _SafeStr_4495) + " view: ") + _SafeStr_4494.window.name));
                    if (((!(_SafeStr_4495 == true)) || (!(_SafeStr_4494.window.name == "me_menu_top_view"))))
                    {
                        return;
                    };
                    (_SafeStr_4494 as MeMenuMainView).setIconAssets("clothes_icon", "me_menu_top_view", "clothes_highlighter_blue");
                    return;
                case "HHTPNUFWE_AE_STARTED":
                    hide();
                    return;
            };
        }

        private function onToolbarClicked(_arg_1:RoomWidgetToolbarClickedUpdateEvent):void
        {
            var _local_2:* = null;
            if (_SafeStr_4495)
            {
                if (((!(_SafeStr_4079 == null)) && (WindowToggle.isHiddenByOtherWindows(_SafeStr_4079))))
                {
                    _SafeStr_4079.activate();
                    return;
                };
                _SafeStr_4495 = false;
            }
            else
            {
                _SafeStr_4495 = true;
            };
            if (_SafeStr_4495)
            {
                _local_2 = new RoomWidgetMeMenuMessage("RWMMM_MESSAGE_ME_MENU_OPENED");
                if (messageListener != null)
                {
                    messageListener.processWidgetMessage(_local_2);
                };
                changeView("me_menu_top_view");
            }
            else
            {
                hide();
            };
        }

        private function onUpdateEffects(_arg_1:RoomWidgetUpdateEffectsUpdateEvent):void
        {
            _SafeStr_4502 = false;
            for each (var _local_2:_SafeStr_3271 in _arg_1.effects)
            {
                if (_local_2.isInUse)
                {
                    _SafeStr_4502 = true;
                };
            };
        }

        private function onAvatarDeselected(_arg_1:Event):void
        {
            if (((!(_SafeStr_4494 == null)) && (!(_SafeStr_4494.window.name == "me_menu_my_clothes_view"))))
            {
                hide();
            };
        }

        private function onAvatarEditorClosed(_arg_1:RoomWidgetAvatarEditorUpdateEvent):void
        {
            if (((!(_SafeStr_4494 == null)) && (_SafeStr_4494.window.name == "me_menu_my_clothes_view")))
            {
                changeView("me_menu_top_view");
            };
        }

        private function onHideAvatarEditor(_arg_1:RoomWidgetAvatarEditorUpdateEvent):void
        {
            if (((!(_SafeStr_4494 == null)) && (_SafeStr_4494.window.name == "me_menu_my_clothes_view")))
            {
                changeView("me_menu_top_view");
            };
        }

        private function onWaveEvent(_arg_1:RoomWidgetWaveUpdateEvent):void
        {
            _SafeStr_14.log("[MeMenuWidget] Wave Event received");
        }

        private function onMiniMailUpdate(_arg_1:RoomWidgetMiniMailUpdateEvent):void
        {
            if (_SafeStr_4494)
            {
                _SafeStr_4494.updateUnseenItemCount("minimail", handler.container.messenger.getUnseenMiniMailMessageCount());
            };
        }

        private function onDanceEvent(_arg_1:RoomWidgetDanceUpdateEvent):void
        {
            _SafeStr_14.log(("[MeMenuWidget] Dance Event received, style: " + _arg_1.style));
        }

        private function onHabboClubEvent(_arg_1:RoomWidgetHabboClubUpdateEvent):void
        {
            var _local_2:* = (!(_arg_1.daysLeft == _SafeStr_4496));
            _SafeStr_4496 = _arg_1.daysLeft;
            _SafeStr_4500 = _arg_1.periodsLeft;
            _SafeStr_9042 = _arg_1.pastPeriods;
            _SafeStr_4499 = _arg_1.allowClubDances;
            _local_2 = ((_local_2) || (!(_arg_1.clubLevel == _SafeStr_4497)));
            _SafeStr_4497 = _arg_1.clubLevel;
            if (_local_2)
            {
                if (_SafeStr_4494 != null)
                {
                    changeView(_SafeStr_4494.window.name);
                };
            };
        }

        private function onCreditBalance(_arg_1:RoomWidgetPurseUpdateEvent):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            _SafeStr_4498 = _arg_1.balance;
            localizations.registerParameter("widget.memenu.credits", "credits", _SafeStr_4498.toString());
        }

        private function onNormalMode(_arg_1:RoomWidgetRoomEngineUpdateEvent):void
        {
            _SafeStr_3710 = false;
        }

        private function onGameMode(_arg_1:RoomWidgetRoomEngineUpdateEvent):void
        {
            _SafeStr_3710 = true;
        }

        public function get allowHabboClubDances():Boolean
        {
            return (_SafeStr_4499);
        }

        public function get isHabboClubActive():Boolean
        {
            return (_SafeStr_4496 > 0);
        }

        public function get habboClubDays():int
        {
            return (_SafeStr_4496);
        }

        public function get habboClubPeriods():int
        {
            return (_SafeStr_4500);
        }

        public function get habboClubLevel():int
        {
            return (_SafeStr_4497);
        }

        public function get isMinimailEnabled():Boolean
        {
            return (_SafeStr_4501);
        }

        public function get config():_SafeStr_19
        {
            return (_config);
        }

        public function get hasEffectOn():Boolean
        {
            return (_SafeStr_4502);
        }

        public function get isDancing():Boolean
        {
            return (_SafeStr_4503);
        }

        public function set isDancing(_arg_1:Boolean):void
        {
            _SafeStr_4503 = _arg_1;
        }

        public function get userId():int
        {
            return (_SafeStr_4128);
        }

        public function get unreadMiniMailMessageCount():int
        {
            return (handler.container.messenger.getUnseenMiniMailMessageCount());
        }


    }
}//package com.sulake.habbo.ui.widget.memenu

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_19 = "_-01r" (String#1323, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3271 = "_-z1P" (String#7829, DoABC#4)
// _SafeStr_3710 = "_-Ki" (String#3194, DoABC#4)
// _SafeStr_3914 = "_-w1m" (String#1204, DoABC#4)
// _SafeStr_4079 = "_-f1q" (String#323, DoABC#4)
// _SafeStr_4128 = "_-q1y" (String#518, DoABC#4)
// _SafeStr_4494 = "_-LI" (String#1588, DoABC#4)
// _SafeStr_4495 = "_-b12" (String#2547, DoABC#4)
// _SafeStr_4496 = "_-Ah" (String#13292, DoABC#4)
// _SafeStr_4497 = "_-12o" (String#14641, DoABC#4)
// _SafeStr_4498 = "_-xP" (String#18582, DoABC#4)
// _SafeStr_4499 = "_-71N" (String#19961, DoABC#4)
// _SafeStr_4500 = "_-22k" (String#20291, DoABC#4)
// _SafeStr_4501 = "_-gt" (String#18115, DoABC#4)
// _SafeStr_4502 = "_-N1Y" (String#12765, DoABC#4)
// _SafeStr_4503 = "_-zv" (String#9515, DoABC#4)
// _SafeStr_9040 = "_-Q1j" (String#40230, DoABC#4)
// _SafeStr_9041 = "_-91T" (String#33051, DoABC#4)
// _SafeStr_9042 = "_-M10" (String#26208, DoABC#4)


