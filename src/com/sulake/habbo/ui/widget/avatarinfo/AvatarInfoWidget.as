// by nota

//com.sulake.habbo.ui.widget.avatarinfo.AvatarInfoWidget

package com.sulake.habbo.ui.widget.avatarinfo
{
    import com.sulake.habbo.ui.widget.RoomWidgetBase;
    import com.sulake.core.runtime._SafeStr_41;
    import com.sulake.habbo.ui.widget.contextmenu._SafeStr_3149;
    import com.sulake.core.runtime._SafeStr_20;
    import com.sulake.core.runtime._SafeStr_19;
    import flash.utils.Timer;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.habbo.window.utils._SafeStr_3114;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.habbo.ui.handler.AvatarInfoWidgetHandler;
    import com.sulake.habbo.room.events.RoomEngineObjectEvent;
    import com.sulake.habbo.ui.widget.events.UseProductItem;
    import com.sulake.habbo.inventory.events.HabboInventoryEffectsEvent;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetRoomObjectMessage;
    import com.sulake.habbo.ui.widget.avatarinfo.botskills.BotSkillConfigurationViewBase;
    import flash.events.IEventDispatcher;
    import com.sulake.habbo.ui.widget.events.RoomWidgetAvatarInfoEvent;
    import com.sulake.habbo.ui.widget.events.RoomWidgetRoomObjectNameEvent;
    import com.sulake.habbo.ui.widget.events.RoomWidgetRoomObjectUpdateEvent;
    import com.sulake.habbo.ui.widget.events.RoomWidgetPetStatusUpdateEvent;
    import com.sulake.habbo.ui.widget.events.RoomWidgetPetLevelUpdateEvent;
    import com.sulake.habbo.ui.widget.events.RoomWidgetPetBreedingResultEvent;
    import com.sulake.habbo.ui.widget.events.RoomWidgetPetBreedingEvent;
    import com.sulake.habbo.ui.widget.events.RoomWidgetConfirmPetBreedingEvent;
    import com.sulake.habbo.ui.widget.events.RoomWidgetConfirmPetBreedingResultEvent;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUserInfoUpdateEvent;
    import com.sulake.habbo.ui.widget.events.RoomWidgetRentableBotInfoUpdateEvent;
    import com.sulake.habbo.ui.widget.events.RoomWidgetRentableBotSkillListUpdateEvent;
    import com.sulake.habbo.ui.widget.events.RoomWidgetRentableBotForceOpenContextMenuEvent;
    import com.sulake.habbo.ui.widget.events.RoomWidgetPetInfoUpdateEvent;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import com.sulake.habbo.session._SafeStr_3241;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.room.utils.RoomEnterEffect;
    import com.sulake.habbo.ui.widget.contextmenu.ContextInfoView;
    import flash.events.TimerEvent;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetGetObjectLocationMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUserLocationUpdateEvent;
    import com.sulake.habbo.ui.widget.memenu._SafeStr_3271;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.habbo.ui.widget.events.ConfirmPetBreedingPetData;
    import _-m1i._SafeStr_677;
    import com.sulake.habbo.ui.widget.avatarinfo.botskills.BotChatterMarkovConfiguration;
    import com.sulake.habbo.ui.widget.avatarinfo.botskills.BotChangeNameConfiguration;
    import com.sulake.habbo.ui.widget.avatarinfo.botskills._SafeStr_3297;
    import flash.geom.Point;
    import _-u15._SafeStr_926;
    import _-u15._SafeStr_423;
    import com.sulake.habbo.friendlist._SafeStr_1874;

    public class AvatarInfoWidget extends RoomWidgetBase implements _SafeStr_41, _SafeStr_3149 
    {

        private static const EFFECT_TYPE_RIDE:int = 77;
        private static const EFFECT_TYPE_DEEP_WATER:int = 29;
        private static const EFFECT_TYPE_SHALLOW_WATER:int = 30;
        private static const _SafeStr_8949:int = 185;
        private static const AVATAR_HIGHLIGHT_DURATION_MSEC:int = 5000;
        private static const _SafeStr_8950:String = "avatar";
        private static const _SafeStr_8951:String = "use_minimized_own_avatar_menu";

        private var _SafeStr_4147:_SafeStr_20;
        private var _configuration:_SafeStr_19;
        private var _SafeStr_3882:AvatarContextInfoButtonView;
        private var _SafeStr_4823:DecorateModeView;
        private var _SafeStr_3883:Boolean = false;
        private var _SafeStr_3710:Boolean = false;
        private var _SafeStr_4826:Boolean = false;
        private var _SafeStr_4834:Timer;
        private var _SafeStr_4829:_SafeStr_3363;
        private var _SafeStr_4830:_SafeStr_3344;
        private var _SafeStr_4828:PetInfoData;
        private var _SafeStr_4827:int = -1;
        private var _SafeStr_4833:Boolean = false;
        private var _SafeStr_4819:AvatarContextInfoButtonView;
        private var _cachedOwnAvatarMenu:OwnAvatarMenuView;
        private var _SafeStr_4820:AvatarMenuView;
        private var _SafeStr_4821:RentableBotMenuView;
        private var _SafeStr_4831:OwnPetMenuView;
        private var _SafeStr_4822:PetMenuView;
        private var _SafeStr_4832:NewUserHelpView;
        private var _SafeStr_4812:_SafeStr_24;
        private var _SafeStr_4818:_SafeStr_24;
        private var _SafeStr_4813:_SafeStr_24;
        private var _SafeStr_4816:UseProductConfirmationView;
        private var _SafeStr_4814:BreedMonsterPlantsConfirmationView;
        private var _SafeStr_4815:ConfirmPetBreedingView;
        private var _SafeStr_4817:BreedPetsResultView;
        private var _breedingConfirmationAlert:_SafeStr_3114;
        private var _SafeStr_4836:int = -1;
        private var _SafeStr_4835:int = -1;
        private var _SafeStr_4503:Boolean = false;
        private var _handlePetInfo:Boolean = true;
        private var _catalog:IHabboCatalog;
        private var _SafeStr_4824:_SafeStr_24 = new _SafeStr_24();
        private var _SafeStr_4825:_SafeStr_24 = new _SafeStr_24();
        private var _SafeStr_4837:NestBreedingSuccessView;

        public function AvatarInfoWidget(_arg_1:IRoomWidgetHandler, _arg_2:_SafeStr_1695, _arg_3:_SafeStr_21, _arg_4:_SafeStr_19, _arg_5:_SafeStr_18, _arg_6:_SafeStr_20, _arg_7:IHabboCatalog)
        {
            super(_arg_1, _arg_2, _arg_3, _arg_5);
            _SafeStr_4147 = _arg_6;
            _catalog = _arg_7;
            _configuration = _arg_4;
            _SafeStr_4829 = new _SafeStr_3363();
            _SafeStr_4828 = new PetInfoData();
            _SafeStr_4830 = null;
            _SafeStr_4812 = new _SafeStr_24();
            _SafeStr_4818 = new _SafeStr_24();
            _SafeStr_4813 = new _SafeStr_24();
            this.handler.roomEngine.events.addEventListener("REOE_ADDED", onRoomObjectAdded);
            this.handler.roomEngine.events.addEventListener("REOE_REMOVED", onRoomObjectRemoved);
            this.handler.container.inventory.events.addEventListener("HIEE_EFFECTS_CHANGED", onEffectsChanged);
            this.handler.widget = this;
        }

        public function get component():_SafeStr_20
        {
            return (_SafeStr_4147);
        }

        public function get handler():AvatarInfoWidgetHandler
        {
            return (_SafeStr_3914 as AvatarInfoWidgetHandler);
        }

        public function get configuration():_SafeStr_19
        {
            return (_configuration);
        }

        public function get localization():_SafeStr_18
        {
            return (_SafeStr_4020);
        }

        public function set handlePetInfo(_arg_1:Boolean):void
        {
            _handlePetInfo = _arg_1;
        }

        private function onRoomObjectAdded(_arg_1:RoomEngineObjectEvent):void
        {
            var _local_2:* = null;
            if (_arg_1.category == 100)
            {
                _local_2 = handler.roomSession.userDataManager.getUserDataByIndex(_arg_1.objectId);
                if (_local_2)
                {
                    if (handler.friendList.getFriendNames().indexOf(_local_2.name) > -1)
                    {
                        showUserName(_local_2, _arg_1.objectId);
                    };
                };
            };
        }

        private function onRoomObjectRemoved(_arg_1:RoomEngineObjectEvent):void
        {
            var _local_6:int;
            var _local_4:* = null;
            var _local_5:int;
            var _local_3:* = null;
            if (_arg_1.category == 100)
            {
                for each (var _local_2:UserNameView in _SafeStr_4812)
                {
                    if (_local_2.objectId == _arg_1.objectId)
                    {
                        removeView(_local_2, false);
                    };
                };
                _local_4 = [];
                for each (var _local_8:BreedPetView in _SafeStr_4813)
                {
                    _local_6 = _local_8.requestRoomObjectId;
                    if (_local_6 == _local_5)
                    {
                        _local_4.push(_local_8);
                    };
                };
                for each (_local_8 in _local_4)
                {
                    removeView(_local_8, false);
                };
                if (_SafeStr_4814 != null)
                {
                    if (((_arg_1.objectId == _SafeStr_4814.requestRoomObjectId) || (_arg_1.objectId == _SafeStr_4814.targetRoomObjectId)))
                    {
                        removeBreedMonsterPlantsConfirmationView();
                    };
                };
                if (_SafeStr_4815 != null)
                {
                    if (((_arg_1.objectId == _SafeStr_4815.requestRoomObjectId) || (_arg_1.objectId == _SafeStr_4815.targetRoomObjectId)))
                    {
                        removeConfirmPetBreedingView();
                    };
                };
                if (_SafeStr_4816 != null)
                {
                    if (((_arg_1.objectId == _SafeStr_4816.requestObjectId) || (_arg_1.objectId == _SafeStr_4816.targetRoomObjectId)))
                    {
                        removeUseProductConfirmationView();
                    };
                };
            };
            if (_arg_1.category == 10)
            {
                _local_5 = _arg_1.objectId;
                if (_SafeStr_4816 != null)
                {
                    if (_SafeStr_4816.requestObjectId == _local_5)
                    {
                        removeUseProductConfirmationView();
                    };
                };
                if (_SafeStr_4817 != null)
                {
                    _SafeStr_4817.roomObjectRemoved(_local_5);
                };
                _local_3 = [];
                for each (var _local_7:UseProductView in _SafeStr_4818)
                {
                    _local_6 = _local_7.requestRoomObjectId;
                    if (_local_6 == _local_5)
                    {
                        _local_3.push(_local_7);
                    };
                };
                for each (_local_7 in _local_3)
                {
                    removeView(_local_7, false);
                };
            };
        }

        public function showUseProductMenuForItems(_arg_1:Array):void
        {
            var _local_3:* = null;
            removeUseProductViews();
            removeUseProductConfirmationView();
            removeBreedMonsterPlantsConfirmationView();
            for each (var _local_2:UseProductItem in _arg_1)
            {
                _local_3 = handler.roomSession.userDataManager.getUserDataByIndex(_local_2.id);
                showUseProductMenu(_local_3, _local_2);
            };
        }

        public function showBreedPetMenuForItems(_arg_1:Array):void
        {
            var _local_3:* = null;
            removeBreedPetViews();
            removeUseProductConfirmationView();
            removeBreedMonsterPlantsConfirmationView();
            for each (var _local_2:UseProductItem in _arg_1)
            {
                _local_3 = handler.roomSession.userDataManager.getUserDataByIndex(_local_2.id);
                showBreedPetMenu(_local_3, _local_2);
            };
        }

        private function onEffectsChanged(_arg_1:HabboInventoryEffectsEvent):void
        {
            if ((_SafeStr_3882 is OwnAvatarMenuView))
            {
                (_SafeStr_3882 as OwnAvatarMenuView).updateButtons();
            };
        }

        private function getOwnCharacterInfo():void
        {
            messageListener.processWidgetMessage(new RoomWidgetRoomObjectMessage("RWROM_GET_OWN_CHARACTER_INFO", 0, 0));
        }

        override public function dispose():void
        {
            if (disposed)
            {
                return;
            };
            removeAvatarHighlightTimer();
            for each (var _local_1:UserNameView in _SafeStr_4812)
            {
                _local_1.dispose();
            };
            _SafeStr_4812 = null;
            for each (var _local_2:UseProductView in _SafeStr_4818)
            {
                _local_2.dispose();
            };
            _SafeStr_4818 = null;
            for each (var _local_4:BreedPetView in _SafeStr_4813)
            {
                _local_4.dispose();
            };
            _SafeStr_4813 = null;
            if (_SafeStr_4147)
            {
                _SafeStr_4147.removeUpdateReceiver(this);
                _SafeStr_4147 = null;
            };
            if (_SafeStr_4819)
            {
                _SafeStr_4819.dispose();
                _SafeStr_4819 = null;
            };
            if (_SafeStr_4820)
            {
                _SafeStr_4820.dispose();
                _SafeStr_4820 = null;
            };
            if (_cachedOwnAvatarMenu)
            {
                _cachedOwnAvatarMenu.dispose();
                _cachedOwnAvatarMenu = null;
            };
            if (_SafeStr_4821)
            {
                _SafeStr_4821.dispose();
                _SafeStr_4821 = null;
            };
            if (_SafeStr_4822)
            {
                _SafeStr_4822.dispose();
                _SafeStr_4822 = null;
            };
            if (_SafeStr_3882)
            {
                if (!_SafeStr_3882.disposed)
                {
                    _SafeStr_3882.dispose();
                    _SafeStr_3882 = null;
                };
            };
            if (_SafeStr_4823)
            {
                _SafeStr_4823.dispose();
                _SafeStr_4823 = null;
            };
            if (_SafeStr_4816)
            {
                _SafeStr_4816.dispose();
                _SafeStr_4816 = null;
            };
            removeBreedMonsterPlantsConfirmationView();
            removeConfirmPetBreedingView();
            if (_SafeStr_4817)
            {
                _SafeStr_4817.dispose();
                _SafeStr_4817 = null;
            };
            if (_breedingConfirmationAlert)
            {
                _breedingConfirmationAlert.dispose();
                _breedingConfirmationAlert = null;
            };
            if (_SafeStr_4824)
            {
                for each (var _local_3:int in _SafeStr_4824.getKeys())
                {
                    BotSkillConfigurationViewBase(_SafeStr_4824.getValue(_local_3)).dispose();
                };
                _SafeStr_4824.dispose();
                _SafeStr_4824 = null;
            };
            if (((_SafeStr_4825) && (_SafeStr_4825.length > 0)))
            {
                _SafeStr_4825.dispose();
                _SafeStr_4825 = null;
            };
            handler.roomEngine.events.removeEventListener("REOE_ADDED", onRoomObjectAdded);
            handler.roomEngine.events.removeEventListener("REOE_REMOVED", onRoomObjectRemoved);
            handler.container.inventory.events.removeEventListener("HIEE_EFFECTS_CHANGED", onEffectsChanged);
            _SafeStr_3882 = null;
            _configuration = null;
            super.dispose();
        }

        public function close():void
        {
            removeView(_SafeStr_3882, false);
        }

        override public function registerUpdateEvents(_arg_1:IEventDispatcher):void
        {
            if (!_arg_1)
            {
                return;
            };
            _arg_1.addEventListener("RWRBFOCME_OPEN", updateEventHandler);
            _arg_1.addEventListener("RWRBSLUE_SKILL_LIST", updateEventHandler);
            _arg_1.addEventListener("RWRBIUE_RENTABLE_BOT", updateEventHandler);
            _arg_1.addEventListener("RWAIE_AVATAR_INFO", updateEventHandler);
            _arg_1.addEventListener("RWUIUE_OWN_USER", updateEventHandler);
            _arg_1.addEventListener("RWUIUE_PEER", updateEventHandler);
            _arg_1.addEventListener("RWROUE_FURNI_ADDED", updateEventHandler);
            _arg_1.addEventListener("RWROUE_OBJECT_SELECTED", updateEventHandler);
            _arg_1.addEventListener("RWROUE_OBJECT_DESELECTED", updateEventHandler);
            _arg_1.addEventListener("RWFIUE_FURNI", updateEventHandler);
            _arg_1.addEventListener("RWUIUE_BOT", updateEventHandler);
            _arg_1.addEventListener("RWPIUE_PET_INFO", updateEventHandler);
            _arg_1.addEventListener("rwudue_user_data_updated", updateEventHandler);
            _arg_1.addEventListener("RWROUE_USER_REMOVED", updateEventHandler);
            _arg_1.addEventListener("RWREUE_NORMAL_MODE", updateEventHandler);
            _arg_1.addEventListener("RWREUE_GAME_MODE", updateEventHandler);
            _arg_1.addEventListener("RWONE_TYPE", updateEventHandler);
            _arg_1.addEventListener("RWROUE_OBJECT_ROLL_OVER", updateEventHandler);
            _arg_1.addEventListener("RWROUE_OBJECT_ROLL_OUT", updateEventHandler);
            _arg_1.addEventListener("RWPIUE_PET_STATUS_UPDATE", updateEventHandler);
            _arg_1.addEventListener("RWPLUE_PET_LEVEL_UPDATE", updateEventHandler);
            _arg_1.addEventListener("RWPBRE_PET_BREEDING_RESULT", updateEventHandler);
            _arg_1.addEventListener("RWPPBE_PET_BREEDING_", updateEventHandler);
            _arg_1.addEventListener("RWIUM_INVENTORY_UPDATED", updateEventHandler);
            _arg_1.addEventListener("RWPPBE_CONFIRM_PET_BREEDING_", updateEventHandler);
            _arg_1.addEventListener("RWPPBE_CONFIRM_PET_BREEDING_RESULT", updateEventHandler);
            super.registerUpdateEvents(_arg_1);
        }

        override public function unregisterUpdateEvents(_arg_1:IEventDispatcher):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            _arg_1.removeEventListener("RWRBFOCME_OPEN", updateEventHandler);
            _arg_1.removeEventListener("RWRBSLUE_SKILL_LIST", updateEventHandler);
            _arg_1.removeEventListener("RWRBIUE_RENTABLE_BOT", updateEventHandler);
            _arg_1.removeEventListener("RWAIE_AVATAR_INFO", updateEventHandler);
            _arg_1.removeEventListener("RWUIUE_OWN_USER", updateEventHandler);
            _arg_1.removeEventListener("RWUIUE_PEER", updateEventHandler);
            _arg_1.removeEventListener("RWROUE_FURNI_ADDED", updateEventHandler);
            _arg_1.removeEventListener("RWROUE_OBJECT_SELECTED", updateEventHandler);
            _arg_1.removeEventListener("RWROUE_OBJECT_DESELECTED", updateEventHandler);
            _arg_1.removeEventListener("RWFIUE_FURNI", updateEventHandler);
            _arg_1.removeEventListener("RWUIUE_BOT", updateEventHandler);
            _arg_1.removeEventListener("RWPIUE_PET_INFO", updateEventHandler);
            _arg_1.removeEventListener("rwudue_user_data_updated", updateEventHandler);
            _arg_1.removeEventListener("RWROUE_USER_REMOVED", updateEventHandler);
            _arg_1.removeEventListener("RWREUE_NORMAL_MODE", updateEventHandler);
            _arg_1.removeEventListener("RWREUE_GAME_MODE", updateEventHandler);
            _arg_1.removeEventListener("RWONE_TYPE", updateEventHandler);
            _arg_1.removeEventListener("RWROUE_OBJECT_ROLL_OUT", updateEventHandler);
            _arg_1.removeEventListener("RWROUE_OBJECT_ROLL_OUT", updateEventHandler);
            _arg_1.removeEventListener("RWPIUE_PET_STATUS_UPDATE", updateEventHandler);
            _arg_1.removeEventListener("RWPLUE_PET_LEVEL_UPDATE", updateEventHandler);
            _arg_1.removeEventListener("RWPBRE_PET_BREEDING_RESULT", updateEventHandler);
            _arg_1.removeEventListener("RWPPBE_PET_BREEDING_", updateEventHandler);
            _arg_1.removeEventListener("RWIUM_INVENTORY_UPDATED", updateEventHandler);
            _arg_1.removeEventListener("RWPPBE_CONFIRM_PET_BREEDING_", updateEventHandler);
            _arg_1.removeEventListener("RWPPBE_CONFIRM_PET_BREEDING_RESULT", updateEventHandler);
        }

        private function updateEventHandler(_arg_1:RoomWidgetUpdateEvent):void
        {
            var _local_12:* = null;
            var _local_8:* = null;
            var _local_3:* = null;
            var _local_22:* = null;
            var _local_27:* = null;
            var _local_2:* = null;
            var _local_4:* = null;
            var _local_14:* = null;
            var _local_20:* = null;
            var _local_7:int;
            var _local_25:int;
            var _local_16:* = null;
            var _local_15:* = null;
            var _local_9:* = null;
            var _local_11:* = null;
            var _local_13:* = null;
            var _local_5:* = null;
            var _local_26:* = null;
            var _local_23:* = null;
            var _local_18:* = null;
            var _local_21:int;
            var _local_17:* = null;
            var _local_6:* = null;
            var _local_24:* = null;
            var _local_19:* = null;
            switch (_arg_1.type)
            {
                case "RWAIE_AVATAR_INFO":
                    _local_12 = (_arg_1 as RoomWidgetAvatarInfoEvent);
                    _SafeStr_4826 = (((!(_SafeStr_3883)) && (!(handler.container.roomSession == null))) && (_local_12.roomIndex == handler.container.roomSession.ownUserRoomId));
                    if (_local_12.allowNameChange)
                    {
                        useMinimizedOwnAvatarMenu = true;
                        selectOwnAvatar();
                    }
                    else
                    {
                        updateUserView(_local_12.userId, _local_12.userName, _local_12.userType, _local_12.roomIndex, _local_12.allowNameChange, null);
                    };
                    _SafeStr_3883 = true;
                    break;
                case "RWONE_TYPE":
                    if (RoomWidgetRoomObjectNameEvent(_arg_1).category == 100)
                    {
                        updateUserView(RoomWidgetRoomObjectNameEvent(_arg_1).userId, RoomWidgetRoomObjectNameEvent(_arg_1).userName, RoomWidgetRoomObjectNameEvent(_arg_1).userType, RoomWidgetRoomObjectNameEvent(_arg_1).roomIndex, false, null);
                    };
                    break;
                case "RWROUE_FURNI_ADDED":
                    if (RoomWidgetRoomObjectUpdateEvent(_arg_1).category == 10)
                    {
                        if (_SafeStr_4817 != null)
                        {
                            _SafeStr_4817.roomObjectAdded(RoomWidgetRoomObjectUpdateEvent(_arg_1).id);
                        };
                    };
                    break;
                case "RWROUE_OBJECT_SELECTED":
                    if (RoomWidgetRoomObjectUpdateEvent(_arg_1).category == 100)
                    {
                        _handlePetInfo = true;
                    };
                    removeBreedPetViews();
                    break;
                case "RWROUE_OBJECT_DESELECTED":
                    if (((_SafeStr_3882) && (!(_SafeStr_3882 is NewUserHelpView))))
                    {
                        removeView(_SafeStr_3882, false);
                    };
                    removeUseProductViews();
                    removeBreedPetViews();
                    break;
                case "RWFIUE_FURNI":
                    if (_SafeStr_3882)
                    {
                        removeView(_SafeStr_3882, false);
                    };
                    removeUseProductViews();
                    removeBreedPetViews();
                    break;
                case "RWROUE_OBJECT_ROLL_OVER":
                    if (_SafeStr_4826)
                    {
                        return;
                    };
                    if (!(((((_SafeStr_3882 is AvatarMenuView) || (_SafeStr_3882 is OwnAvatarMenuView)) || (_SafeStr_3882 is OwnPetMenuView)) || (_SafeStr_3882 is NewUserHelpView)) || (_SafeStr_3882 is RentableBotMenuView)))
                    {
                        _SafeStr_4827 = RoomWidgetRoomObjectUpdateEvent(_arg_1).id;
                        messageListener.processWidgetMessage(new RoomWidgetRoomObjectMessage("RWROM_GET_OBJECT_NAME", RoomWidgetRoomObjectUpdateEvent(_arg_1).id, RoomWidgetRoomObjectUpdateEvent(_arg_1).category));
                    };
                    break;
                case "RWROUE_OBJECT_ROLL_OUT":
                    if (_SafeStr_4826)
                    {
                        return;
                    };
                    if (!(((((_SafeStr_3882 is AvatarMenuView) || (_SafeStr_3882 is OwnAvatarMenuView)) || (_SafeStr_3882 is OwnPetMenuView)) || (_SafeStr_3882 is NewUserHelpView)) || (_SafeStr_3882 is RentableBotMenuView)))
                    {
                        if (RoomWidgetRoomObjectUpdateEvent(_arg_1).id == _SafeStr_4827)
                        {
                            if (((_SafeStr_3882) && (!(_SafeStr_3882.allowNameChange))))
                            {
                                removeView(_SafeStr_3882, false);
                                _SafeStr_4827 = -1;
                            };
                        };
                    };
                    break;
                case "RWPIUE_PET_STATUS_UPDATE":
                    _local_8 = (_arg_1 as RoomWidgetPetStatusUpdateEvent);
                    if (((_SafeStr_3882) && (_SafeStr_3882 is OwnPetMenuView)))
                    {
                        if (((!(_local_8 == null)) && (!(_SafeStr_4828 == null))))
                        {
                            _local_3 = handler.roomSession.userDataManager.getUserDataByIndex(_local_8.petId);
                            if (((!(_local_3 == null)) && (_local_3.webID == _SafeStr_4828.id)))
                            {
                                removeView(_SafeStr_3882, true);
                            };
                        };
                    };
                    if (_local_8 != null)
                    {
                        removeBreedPetViewsWithId(_local_8.petId);
                    };
                    break;
                case "RWPLUE_PET_LEVEL_UPDATE":
                    _local_22 = (_arg_1 as RoomWidgetPetLevelUpdateEvent);
                    if (((_SafeStr_3882) && (_SafeStr_3882 is OwnPetMenuView)))
                    {
                        if (((!(_local_22 == null)) && (!(_SafeStr_4828 == null))))
                        {
                            _local_27 = handler.roomSession.userDataManager.getUserDataByIndex(_local_22.petId);
                            if (((!(_local_27 == null)) && (_local_27.webID == _SafeStr_4828.id)))
                            {
                                removeView(_SafeStr_3882, true);
                            };
                        };
                    };
                    if (_local_22 != null)
                    {
                        removeBreedPetViewsWithId(_local_22.petId);
                    };
                    break;
                case "RWPBRE_PET_BREEDING_RESULT":
                    _local_2 = (_arg_1 as RoomWidgetPetBreedingResultEvent);
                    _local_4 = new BreedPetsResultData();
                    _local_4.stuffId = _local_2.resultData.stuffId;
                    _local_4.classId = _local_2.resultData.classId;
                    _local_4.productCode = _local_2.resultData.productCode;
                    _local_4.userId = _local_2.resultData.userId;
                    _local_4.userName = _local_2.resultData.userName;
                    _local_4.rarityLevel = _local_2.resultData.rarityLevel;
                    _local_4.hasMutation = _local_2.resultData.hasMutation;
                    _local_14 = new BreedPetsResultData();
                    _local_14.stuffId = _local_2.resultData2.stuffId;
                    _local_14.classId = _local_2.resultData2.classId;
                    _local_14.productCode = _local_2.resultData2.productCode;
                    _local_14.userId = _local_2.resultData2.userId;
                    _local_14.userName = _local_2.resultData2.userName;
                    _local_14.rarityLevel = _local_2.resultData2.rarityLevel;
                    _local_14.hasMutation = _local_2.resultData2.hasMutation;
                    showBreedPetsResultView(_local_4, _local_14);
                    break;
                case "RWPPBE_PET_BREEDING_":
                    _local_20 = (_arg_1 as RoomWidgetPetBreedingEvent);
                    _local_7 = findPetRoomObjectIdByWebId(_local_20.ownPetId);
                    _local_25 = findPetRoomObjectIdByWebId(_local_20.otherPetId);
                    switch (_local_20.state)
                    {
                        case 0:
                            showBreedMonsterPlantsConfirmationView(_local_7, _local_25, false);
                            break;
                        case 1:
                            cancelBreedingPets(_local_7, _local_25);
                            break;
                        case 2:
                            acceptBreedingPets(_local_7, _local_25);
                            break;
                        case 3:
                            showBreedMonsterPlantsConfirmationView(_local_7, _local_25, true);
                        default:
                    };
                    break;
                case "RWIUM_INVENTORY_UPDATED":
                    if (_SafeStr_4817 != null)
                    {
                        _SafeStr_4817.updatePlacingButtons();
                    };
                    break;
                case "RWPPBE_CONFIRM_PET_BREEDING_":
                    _local_16 = (_arg_1 as RoomWidgetConfirmPetBreedingEvent);
                    showConfirmPetBreedingView(_local_16.pet1, _local_16.pet2, _local_16.nestId, _local_16.rarityCategories, _local_16.resultPetTypeId);
                    break;
                case "RWPPBE_CONFIRM_PET_BREEDING_RESULT":
                    _local_15 = (_arg_1 as RoomWidgetConfirmPetBreedingResultEvent);
                    switch (_local_15.result)
                    {
                        case 0:
                            removeConfirmPetBreedingView();
                            break;
                        case 3:
                            windowManager.simpleAlert("${breedpets.confirmation.alert.title}", "${breedpets.confirmation.alert.name.invalid.head}", "${breedpets.confirmation.alert.name.invalid.desc}");
                            if (_SafeStr_4815)
                            {
                                _SafeStr_4815.enable();
                            };
                            break;
                        case 1:
                            windowManager.simpleAlert("${breedpets.confirmation.alert.title}", "${breedpets.confirmation.alert.nonest.head}", "${breedpets.confirmation.alert.nonest.desc}");
                            removeConfirmPetBreedingView();
                            break;
                        case 2:
                            windowManager.simpleAlert("${breedpets.confirmation.alert.title}", "${breedpets.confirmation.alert.petsmissing.head}", "${breedpets.confirmation.alert.petsmissing.desc}");
                            removeConfirmPetBreedingView();
                        default:
                    };
                    break;
                case "RWUIUE_OWN_USER":
                case "RWUIUE_PEER":
                    _local_9 = (_arg_1 as RoomWidgetUserInfoUpdateEvent);
                    _SafeStr_4829.populate(_local_9);
                    _local_11 = ((_local_9.isSpectatorMode) ? null : _SafeStr_4829);
                    updateUserView(_local_9.webID, _local_9.name, _local_9.userType, _local_9.userRoomId, _SafeStr_4829.allowNameChange, _local_11);
                    break;
                case "RWRBIUE_RENTABLE_BOT":
                    _local_13 = (_arg_1 as RoomWidgetRentableBotInfoUpdateEvent);
                    if (!_SafeStr_4830)
                    {
                        _SafeStr_4830 = new _SafeStr_3344();
                    };
                    _SafeStr_4830.populate(_local_13);
                    _local_5 = handler.container.roomSessionManager.getSession(_local_21);
                    if (!_local_5)
                    {
                        return;
                    };
                    _local_26 = _local_5.userDataManager.getRentableBotUserData(_local_13.webID);
                    if (!_local_26)
                    {
                        return;
                    };
                    _SafeStr_4825[_local_13.webID.toString()] = _local_26.botSkillData;
                    if (((_SafeStr_4830) && (_local_26.botSkillData)))
                    {
                        _SafeStr_4830.cloneAndSetSkillsWithCommands(_local_26.botSkillData);
                    };
                    updateRentableBotView(_local_13.webID, _local_13.name, _local_13.userRoomId, _SafeStr_4830);
                    break;
                case "RWRBSLUE_SKILL_LIST":
                    _local_23 = (_arg_1 as RoomWidgetRentableBotSkillListUpdateEvent);
                    _SafeStr_4825[_local_23.botId.toString()] = _local_23.botSkillsWithCommands;
                    if (_SafeStr_4830)
                    {
                        _SafeStr_4830.cloneAndSetSkillsWithCommands(_local_23.botSkillsWithCommands);
                        updateRentableBotView(_SafeStr_4830.id, _SafeStr_4830.name, _SafeStr_4830.roomIndex, _SafeStr_4830, true);
                    };
                    break;
                case "RWRBFOCME_OPEN":
                    _local_18 = (_arg_1 as RoomWidgetRentableBotForceOpenContextMenuEvent);
                    if (_SafeStr_4830)
                    {
                        updateRentableBotView(_SafeStr_4830.id, _SafeStr_4830.name, _SafeStr_4830.roomIndex, _SafeStr_4830, false, true);
                    }
                    else
                    {
                        _local_21 = handler.container.roomEngine.activeRoomId;
                        _local_17 = handler.container.roomSessionManager.getSession(_local_21).userDataManager.getUserDataByType(_local_18.botId, 4);
                        messageListener.processWidgetMessage(new RoomWidgetRoomObjectMessage("RWROM_GET_OBJECT_INFO", _local_17.roomObjectId, 100));
                        handler.container.roomEngine.selectAvatar(_local_21, _local_17.roomObjectId);
                    };
                    break;
                case "RWUIUE_BOT":
                    _local_6 = (_arg_1 as RoomWidgetUserInfoUpdateEvent);
                    updateUserView(_local_6.webID, _local_6.name, _local_6.userType, _local_6.userRoomId, false, null);
                    break;
                case "RWPIUE_PET_INFO":
                    if (_handlePetInfo)
                    {
                        _local_24 = (_arg_1 as RoomWidgetPetInfoUpdateEvent);
                        _SafeStr_4828.populate(_local_24);
                        updatePetView(_local_24.id, _local_24.name, _local_24.roomIndex, _SafeStr_4828);
                    };
                    break;
                case "rwudue_user_data_updated":
                    if (!_SafeStr_3883)
                    {
                        getOwnCharacterInfo();
                    };
                    break;
                case "RWROUE_USER_REMOVED":
                    _local_19 = (_arg_1 as RoomWidgetRoomObjectUpdateEvent);
                    if (((_SafeStr_3882) && (_SafeStr_3882.roomIndex == _local_19.id)))
                    {
                        removeView(_SafeStr_3882, false);
                    };
                    for each (var _local_10:UserNameView in _SafeStr_4812)
                    {
                        if (_local_10.objectId == _local_19.id)
                        {
                            removeView(_local_10, false);
                            break;
                        };
                    };
                    removeBreedPetViewsWithId(_local_19.id);
                    break;
                case "RWREUE_NORMAL_MODE":
                    _SafeStr_3710 = false;
                    break;
                case "RWREUE_GAME_MODE":
                    _SafeStr_3710 = true;
            };
            checkUpdateNeed();
        }

        private function findPetRoomObjectIdByWebId(_arg_1:int):int
        {
            var _local_4:int;
            var _local_2:* = null;
            var _local_6:* = null;
            var _local_5:int = handler.container.roomSession.roomId;
            var _local_3:int = handler.container.roomEngine.getRoomObjectCount(_local_5, 100);
            _local_4 = 0;
            while (_local_4 < _local_3)
            {
                _local_2 = handler.container.roomEngine.getRoomObjectWithIndex(_local_5, _local_4, 100);
                _local_6 = handler.container.roomSession.userDataManager.getUserDataByIndex(_local_2.getId());
                if (!((_local_6 == null) || (!(_local_6.type == 2))))
                {
                    if (_local_6.webID == _arg_1)
                    {
                        return (_local_2.getId());
                    };
                };
                _local_4++;
            };
            return (-1);
        }

        private function removeBreedPetViewsWithId(_arg_1:int):void
        {
            var _local_3:Array = [];
            for each (var _local_2:BreedPetView in _SafeStr_4813)
            {
                if (((_local_2.objectId == _arg_1) || (_local_2.requestRoomObjectId == _arg_1)))
                {
                    if (_local_3.indexOf(_local_2) == -1)
                    {
                        _local_3.push(_local_2);
                    };
                };
            };
            for each (var _local_4:BreedPetView in _local_3)
            {
                removeView(_local_4, false);
            };
        }

        public function selectOwnAvatar():void
        {
            var _local_2:* = null;
            if ((((!(handler)) || (!(handler.container))) || (!(handler.roomSession))))
            {
                return;
            };
            var _local_3:int = handler.container.sessionDataManager.userId;
            var _local_1:_SafeStr_3241 = handler.roomSession.userDataManager.getUserData(_local_3);
            if (!_local_1)
            {
                return;
            };
            _local_2 = new RoomWidgetRoomObjectMessage("RWROM_SELECT_OBJECT", _local_1.roomObjectId, 100);
            handler.container.processWidgetMessage(_local_2);
        }

        public function get ownAvatarPosture():String
        {
            var _local_2:* = null;
            var _local_1:IRoomObject = findCurrentUserRoomObject();
            if (_local_1 != null)
            {
                _local_2 = _local_1.getModel();
                if (_local_2 != null)
                {
                    return (_local_2.getString("figure_posture"));
                };
            };
            return ("std");
        }

        public function get canStandUp():Boolean
        {
            var _local_2:* = null;
            var _local_1:IRoomObject = findCurrentUserRoomObject();
            if (_local_1 != null)
            {
                _local_2 = _local_1.getModel();
                if (_local_2 != null)
                {
                    return (_local_2.getNumber("figure_can_stand_up") > 0);
                };
            };
            return (false);
        }

        public function get isSwimming():Boolean
        {
            var _local_3:* = null;
            var _local_2:Number;
            var _local_1:IRoomObject = findCurrentUserRoomObject();
            if (_local_1 != null)
            {
                _local_3 = _local_1.getModel();
                if (_local_3 != null)
                {
                    _local_2 = _local_3.getNumber("figure_effect");
                    return (((_local_2 == 29) || (_local_2 == 30)) || (_local_2 == 185));
                };
            };
            return (false);
        }

        private function updateRentableBotView(_arg_1:int, _arg_2:String, _arg_3:int, _arg_4:_SafeStr_3344, _arg_5:Boolean=false, _arg_6:Boolean=false):void
        {
            if (!_arg_4)
            {
                return;
            };
            var _local_8:Boolean = _configuration.getBoolean("menu.bot.enabled");
            var _local_7:Boolean = ((_arg_5) && (!(_SafeStr_3882)));
            if (_arg_6)
            {
                _local_7 = false;
            };
            if ((((_local_8) && (_SafeStr_3882)) && (!(((((_SafeStr_3882 is AvatarMenuView) || (_SafeStr_3882 is OwnAvatarMenuView)) || (_SafeStr_3882 is PetMenuView)) || (_SafeStr_3882 is OwnPetMenuView)) || (_SafeStr_3882 is RentableBotMenuView)))))
            {
                removeView(_SafeStr_3882, false);
            };
            removeUseProductViews();
            if ((((((((_arg_6) || (((!(_SafeStr_3882 == null)) && (_SafeStr_3882.userId == _arg_1)) && (!(_arg_5)))) || (_SafeStr_3882 == null)) || (!(_SafeStr_3882.userId == _arg_1))) || (!(_SafeStr_3882.userName == _arg_2))) || (!(_SafeStr_3882.roomIndex == _arg_3))) || (!(_SafeStr_3882.userType == 4))))
            {
                if (_SafeStr_3882)
                {
                    removeView(_SafeStr_3882, false);
                };
                if (!_SafeStr_3710)
                {
                    if (!_SafeStr_4821)
                    {
                        _SafeStr_4821 = new RentableBotMenuView(this);
                    };
                    if (!_local_7)
                    {
                        _SafeStr_3882 = _SafeStr_4821;
                        RentableBotMenuView.setup((_SafeStr_3882 as RentableBotMenuView), _arg_1, _arg_2, _arg_3, 4, _arg_4);
                    };
                };
            }
            else
            {
                if ((_SafeStr_3882 is RentableBotMenuView))
                {
                    if (_SafeStr_3882.userName == _arg_2)
                    {
                        removeView(_SafeStr_3882, false);
                    };
                };
            };
        }

        private function updatePetView(_arg_1:int, _arg_2:String, _arg_3:int, _arg_4:PetInfoData):void
        {
            if (!_arg_4)
            {
                return;
            };
            if (((_SafeStr_3882) && (!(((((_SafeStr_3882 is AvatarMenuView) || (_SafeStr_3882 is OwnAvatarMenuView)) || (_SafeStr_3882 is PetMenuView)) || (_SafeStr_3882 is OwnPetMenuView)) || (_SafeStr_3882 is RentableBotMenuView)))))
            {
                removeView(_SafeStr_3882, false);
            };
            removeUseProductViews();
            if ((((((_SafeStr_3882 == null) || (!(_SafeStr_3882.userId == _arg_1))) || (!(_SafeStr_3882.userName == _arg_2))) || (!(_SafeStr_3882.roomIndex == _arg_3))) || (!(_SafeStr_3882.userType == 2))))
            {
                if (_SafeStr_3882)
                {
                    removeView(_SafeStr_3882, false);
                };
                if (!_SafeStr_3710)
                {
                    if (_arg_4.isOwnPet)
                    {
                        if (!_SafeStr_4831)
                        {
                            _SafeStr_4831 = new OwnPetMenuView(this, _catalog);
                        };
                        _SafeStr_3882 = _SafeStr_4831;
                        OwnPetMenuView.setup((_SafeStr_3882 as OwnPetMenuView), _arg_1, _arg_2, _arg_3, 2, _arg_4);
                    }
                    else
                    {
                        if (!_SafeStr_4822)
                        {
                            _SafeStr_4822 = new PetMenuView(this);
                        };
                        _SafeStr_3882 = _SafeStr_4822;
                        PetMenuView.setup((_SafeStr_3882 as PetMenuView), _arg_1, _arg_2, _arg_3, 2, _arg_4);
                    };
                };
            }
            else
            {
                if (((_SafeStr_3882 is AvatarMenuView) || (_SafeStr_3882 is OwnAvatarMenuView)))
                {
                    if (_SafeStr_3882.userName == _arg_2)
                    {
                        removeView(_SafeStr_3882, false);
                    };
                };
            };
        }

        private function updateUserView(_arg_1:int, _arg_2:String, _arg_3:int, _arg_4:int, _arg_5:Boolean, _arg_6:_SafeStr_3363):void
        {
            var _local_7:* = (!(_arg_6 == null));
            if ((((_local_7) && (_SafeStr_3882)) && (!(((((_SafeStr_3882 is AvatarMenuView) || (_SafeStr_3882 is OwnAvatarMenuView)) || (_SafeStr_3882 is PetMenuView)) || (_SafeStr_3882 is OwnPetMenuView)) || (_SafeStr_3882 is RentableBotMenuView)))))
            {
                removeView(_SafeStr_3882, false);
            };
            removeUseProductViews();
            if (((((((_SafeStr_3882 == null) || (!(_SafeStr_3882.userId == _arg_1))) || (!(_SafeStr_3882.userName == _arg_2))) || (!(_SafeStr_3882.roomIndex == _arg_4))) || (!(_SafeStr_3882.userType == 1))) || (_arg_5)))
            {
                if (_SafeStr_3882)
                {
                    removeView(_SafeStr_3882, false);
                };
                if (!_SafeStr_3710)
                {
                    if (_local_7)
                    {
                        if (_arg_6.isOwnUser)
                        {
                            if (isUserDecorating)
                            {
                                return;
                            };
                            if (RoomEnterEffect.isRunning())
                            {
                                if (!_SafeStr_4832)
                                {
                                    _SafeStr_4832 = new NewUserHelpView(this);
                                };
                                _SafeStr_3882 = _SafeStr_4832;
                                NewUserHelpView.setup((_SafeStr_3882 as NewUserHelpView), _arg_1, _arg_2, _arg_4, 1);
                            }
                            else
                            {
                                if (!_cachedOwnAvatarMenu)
                                {
                                    _cachedOwnAvatarMenu = new OwnAvatarMenuView(this);
                                };
                                _SafeStr_3882 = _cachedOwnAvatarMenu;
                                OwnAvatarMenuView.setup((_SafeStr_3882 as OwnAvatarMenuView), _arg_1, _arg_2, _arg_4, 1, _arg_6);
                            };
                        }
                        else
                        {
                            if (!_SafeStr_4820)
                            {
                                _SafeStr_4820 = new AvatarMenuView(this);
                            };
                            _SafeStr_3882 = _SafeStr_4820;
                            AvatarMenuView.setup((_SafeStr_3882 as AvatarMenuView), _arg_1, _arg_2, _arg_4, _arg_3, _arg_6);
                            for each (var _local_8:UserNameView in _SafeStr_4812)
                            {
                                if (_local_8.userId == _arg_1)
                                {
                                    removeView(_local_8, false);
                                    break;
                                };
                            };
                        };
                    }
                    else
                    {
                        if (!handler.roomEngine.isDecorateMode)
                        {
                            if (!_SafeStr_4819)
                            {
                                _SafeStr_4819 = new AvatarContextInfoButtonView(this);
                            };
                            _SafeStr_3882 = _SafeStr_4819;
                            if (handler.container.sessionDataManager.userId == _arg_1)
                            {
                                AvatarContextInfoButtonView.setup(_SafeStr_3882, _arg_1, _arg_2, _arg_4, _arg_3, _arg_5);
                                if (_SafeStr_4826)
                                {
                                    _catalog.windowManager.registerHintWindow("avatar", _SafeStr_3882.window);
                                    _catalog.windowManager.showHint("avatar");
                                    if (!handler.container.sessionDataManager.isNoob)
                                    {
                                        setAvatarHightlightTimer();
                                    };
                                };
                            }
                            else
                            {
                                AvatarContextInfoButtonView.setup(_SafeStr_3882, _arg_1, _arg_2, _arg_4, _arg_3, _arg_5, true);
                            };
                        };
                    };
                };
            }
            else
            {
                if (((_SafeStr_3882 is AvatarMenuView) || (_SafeStr_3882 is OwnAvatarMenuView)))
                {
                    if (_SafeStr_3882.userName == _arg_2)
                    {
                        removeView(_SafeStr_3882, false);
                    };
                };
            };
        }

        public function removeView(_arg_1:ContextInfoView, _arg_2:Boolean):void
        {
            _SafeStr_4826 = false;
            removeAvatarHighlightTimer();
            if (_arg_1)
            {
                if (_SafeStr_4833)
                {
                    _arg_1.hide(_arg_2);
                }
                else
                {
                    _arg_1.dispose();
                    _SafeStr_4819 = null;
                    _SafeStr_4820 = null;
                    _cachedOwnAvatarMenu = null;
                    _SafeStr_4831 = null;
                    _SafeStr_4821 = null;
                    _SafeStr_4822 = null;
                    _SafeStr_4832 = null;
                };
                if (_arg_1 == _SafeStr_3882)
                {
                    _SafeStr_3882 = null;
                };
                if ((_arg_1 is UserNameView))
                {
                    _SafeStr_4812.remove((_arg_1 as UserNameView).userName);
                    _arg_1.dispose();
                    checkUpdateNeed();
                };
                if ((_arg_1 is UseProductView))
                {
                    _SafeStr_4818.remove((_arg_1 as UseProductView).userId);
                    _arg_1.dispose();
                    checkUpdateNeed();
                };
                if ((_arg_1 is BreedPetView))
                {
                    _SafeStr_4813.remove((_arg_1 as BreedPetView).userId);
                    _arg_1.dispose();
                    checkUpdateNeed();
                };
            };
        }

        public function removeUseProductViews():void
        {
            for each (var _local_1:UseProductView in _SafeStr_4818)
            {
                _local_1.dispose();
            };
            _SafeStr_4818.reset();
            checkUpdateNeed();
        }

        public function removeBreedPetViews():void
        {
            for each (var _local_1:BreedPetView in _SafeStr_4813)
            {
                _local_1.dispose();
            };
            _SafeStr_4813.reset();
            checkUpdateNeed();
        }

        public function showUserName(_arg_1:_SafeStr_3241, _arg_2:int):void
        {
            var _local_3:* = null;
            if (_SafeStr_4812[_arg_1.name] == null)
            {
                _local_3 = new UserNameView(this);
                UserNameView.setup(_local_3, _arg_1.webID, _arg_1.name, -1, 1, _arg_2);
                _SafeStr_4812[_arg_1.name] = _local_3;
                checkUpdateNeed();
            };
        }

        public function showGamePlayerName(_arg_1:int, _arg_2:String, _arg_3:uint, _arg_4:int):void
        {
            var _local_5:* = null;
            if (_SafeStr_4812[_arg_2] == null)
            {
                _local_5 = new UserNameView(this, true);
                UserNameView.setup(_local_5, _arg_1, _arg_2, _arg_1, 1, _arg_1, _arg_3, _arg_4);
                _SafeStr_4812[_arg_2] = _local_5;
                checkUpdateNeed();
            };
        }

        private function showUseProductMenu(_arg_1:_SafeStr_3241, _arg_2:UseProductItem):void
        {
            var _local_3:* = null;
            if (_SafeStr_4818[_arg_1.webID.toString()] == null)
            {
                _local_3 = new UseProductView(this);
                UseProductView.setup(_local_3, _arg_1.webID, _arg_1.name, -1, 2, _arg_2);
                _SafeStr_4818[_arg_1.webID.toString()] = _local_3;
                checkUpdateNeed();
            };
        }

        private function showBreedPetMenu(_arg_1:_SafeStr_3241, _arg_2:UseProductItem):void
        {
            var _local_3:* = null;
            if (_SafeStr_4813[_arg_1.webID.toString()] == null)
            {
                _local_3 = new BreedPetView(this);
                BreedPetView.setup(_local_3, _arg_1.webID, _arg_1.name, -1, 2, _arg_2, _arg_1.canBreed);
                _SafeStr_4813[_arg_1.webID.toString()] = _local_3;
                checkUpdateNeed();
            };
        }

        private function setAvatarHightlightTimer():void
        {
            _SafeStr_4834 = new Timer(5000);
            _SafeStr_4834.addEventListener("timer", onAvatarHighlightTimerEvent);
            _SafeStr_4834.start();
        }

        private function removeAvatarHighlightTimer():void
        {
            _SafeStr_4826 = false;
            _catalog.windowManager.unregisterHintWindow("avatar");
            if (!_SafeStr_4834)
            {
                return;
            };
            _SafeStr_4834.stop();
            _SafeStr_4834 = null;
        }

        private function onAvatarHighlightTimerEvent(_arg_1:TimerEvent):void
        {
            removeAvatarHighlightTimer();
        }

        public function checkUpdateNeed():void
        {
            if (!_SafeStr_4147)
            {
                return;
            };
            if ((((((_SafeStr_3882) || (_SafeStr_4812.length > 0)) || (_SafeStr_4818.length > 0)) || (_SafeStr_4813.length > 0)) || ((_SafeStr_4823) && (_SafeStr_4823.isVisible))))
            {
                _SafeStr_4147.registerUpdateReceiver(this, 10);
            }
            else
            {
                _SafeStr_4147.removeUpdateReceiver(this);
            };
        }

        public function update(_arg_1:uint):void
        {
            var _local_3:* = null;
            if (_SafeStr_3882)
            {
                _local_3 = (messageListener.processWidgetMessage(new RoomWidgetGetObjectLocationMessage("RWGOI_MESSAGE_GET_OBJECT_LOCATION", _SafeStr_3882.userId, _SafeStr_3882.userType)) as RoomWidgetUserLocationUpdateEvent);
                if (!_local_3)
                {
                    return;
                };
                _SafeStr_3882.update(_local_3.rectangle, _local_3.screenLocation, _arg_1);
            };
            if (((_SafeStr_4823) && (_SafeStr_4823.isVisible())))
            {
                _local_3 = (messageListener.processWidgetMessage(new RoomWidgetGetObjectLocationMessage("RWGOI_MESSAGE_GET_OBJECT_LOCATION", _SafeStr_4823.userId, _SafeStr_4823.userType)) as RoomWidgetUserLocationUpdateEvent);
                if (!_local_3)
                {
                    return;
                };
                _SafeStr_4823.update(_local_3.rectangle, _local_3.screenLocation, _arg_1);
            };
            for each (var _local_2:UserNameView in _SafeStr_4812)
            {
                if (_local_2.isGameRoomMode)
                {
                    _local_3 = (messageListener.processWidgetMessage(new RoomWidgetGetObjectLocationMessage("RWGOI_MESSAGE_GET_GAME_OBJECT_LOCATION", _local_2.userId, _local_2.userType)) as RoomWidgetUserLocationUpdateEvent);
                }
                else
                {
                    _local_3 = (messageListener.processWidgetMessage(new RoomWidgetGetObjectLocationMessage("RWGOI_MESSAGE_GET_OBJECT_LOCATION", _local_2.userId, _local_2.userType)) as RoomWidgetUserLocationUpdateEvent);
                };
                if (_local_3)
                {
                    _local_2.update(_local_3.rectangle, _local_3.screenLocation, _arg_1);
                };
            };
            for each (var _local_4:UseProductView in _SafeStr_4818)
            {
                _local_3 = (messageListener.processWidgetMessage(new RoomWidgetGetObjectLocationMessage("RWGOI_MESSAGE_GET_OBJECT_LOCATION", _local_4.userId, _local_4.userType)) as RoomWidgetUserLocationUpdateEvent);
                if (_local_3)
                {
                    _local_4.update(_local_3.rectangle, _local_3.screenLocation, _arg_1);
                };
            };
            for each (var _local_5:BreedPetView in _SafeStr_4813)
            {
                _local_3 = (messageListener.processWidgetMessage(new RoomWidgetGetObjectLocationMessage("RWGOI_MESSAGE_GET_OBJECT_LOCATION", _local_5.userId, _local_5.userType)) as RoomWidgetUserLocationUpdateEvent);
                if (_local_3)
                {
                    _local_5.update(_local_3.rectangle, _local_3.screenLocation, _arg_1);
                };
            };
        }

        public function openAvatarEditor():void
        {
            handler.container.avatarEditor.openEditor(0, null, null, true);
            handler.container.avatarEditor.loadOwnAvatarInEditor(0);
        }

        public function get hasClub():Boolean
        {
            return (handler.container.sessionDataManager.hasClub);
        }

        public function get hasVip():Boolean
        {
            return (handler.container.sessionDataManager.hasVip);
        }

        public function get hasEffectOn():Boolean
        {
            var _local_1:Array = handler.container.inventory.getActivatedAvatarEffects();
            for each (var _local_2:_SafeStr_3271 in _local_1)
            {
                if (_local_2.isInUse)
                {
                    return (true);
                };
            };
            return (false);
        }

        public function set isDancing(_arg_1:Boolean):void
        {
            _SafeStr_4503 = _arg_1;
        }

        public function get isDancing():Boolean
        {
            return (_SafeStr_4503);
        }

        public function get hasFreeSaddle():Boolean
        {
            if (_SafeStr_4828 != null)
            {
                return (_SafeStr_4828.hasFreeSaddle);
            };
            return (false);
        }

        public function get isRiding():Boolean
        {
            if (_SafeStr_4828 != null)
            {
                return (_SafeStr_4828.isRiding);
            };
            return (false);
        }

        public function get isCurrentUserRiding():Boolean
        {
            var _local_3:* = null;
            var _local_2:Number;
            var _local_1:IRoomObject = findCurrentUserRoomObject();
            if (_local_1 != null)
            {
                _local_3 = _local_1.getModel();
                if (_local_3 != null)
                {
                    _local_2 = _local_3.getNumber("figure_effect");
                    if (_local_2 == 77)
                    {
                        return (true);
                    };
                };
            };
            return (false);
        }

        public function openTrainingView():void
        {
            handler.container.events.dispatchEvent(new RoomWidgetUpdateEvent("RWPCUE_OPEN_PET_TRAINING"));
        }

        public function closeTrainingView():void
        {
            handler.container.events.dispatchEvent(new RoomWidgetUpdateEvent("RWPCUE_CLOSE_PET_TRAINING"));
        }

        public function get useMinimizedOwnAvatarMenu():Boolean
        {
            return (handler.container.config.getBoolean("use_minimized_own_avatar_menu"));
        }

        public function set useMinimizedOwnAvatarMenu(_arg_1:Boolean):void
        {
            handler.container.config.setProperty("use_minimized_own_avatar_menu", ((_arg_1) ? "1" : "0"));
        }

        public function sendSignRequest(_arg_1:int):void
        {
            handler.container.roomSession.sendSignMessage(_arg_1);
        }

        public function showUseProductConfirmation(_arg_1:int, _arg_2:int, _arg_3:int):void
        {
            if (!_SafeStr_4816)
            {
                _SafeStr_4816 = new UseProductConfirmationView(this);
            };
            _SafeStr_4816.open(_arg_1, _arg_2, _arg_3);
        }

        private function removeUseProductConfirmationView():void
        {
            if (_SafeStr_4816)
            {
                _SafeStr_4816.dispose();
                _SafeStr_4816 = null;
            };
        }

        public function showBreedingPetsWaitingConfirmationAlert(_arg_1:int, _arg_2:int):void
        {
            removeBreedingPetsWaitingConfirmationAlert();
            _breedingConfirmationAlert = windowManager.confirm("${breedpets.confirmation.notification.title}", "${breedpets.confirmation.notification.text}", 0, onWaitingConfirmationAlert);
            _SafeStr_4836 = _arg_1;
            _SafeStr_4835 = _arg_2;
        }

        public function onWaitingConfirmationAlert(_arg_1:_SafeStr_3114, _arg_2:_SafeStr_3116):void
        {
            if (_arg_2.type == "WE_OK")
            {
            };
            if (_arg_2.type == "WE_CANCEL")
            {
                if (((!(_SafeStr_4835 == -1)) && (!(_SafeStr_4835 == -1))))
                {
                    cancelBreedPets(_SafeStr_4836, _SafeStr_4835);
                };
            };
            removeBreedingPetsWaitingConfirmationAlert();
        }

        private function removeBreedingPetsWaitingConfirmationAlert():void
        {
            if (_breedingConfirmationAlert != null)
            {
                _breedingConfirmationAlert.dispose();
                _breedingConfirmationAlert = null;
                _SafeStr_4836 = -1;
                _SafeStr_4835 = -1;
            };
        }

        public function acceptBreedingPets(_arg_1:int, _arg_2:int):void
        {
            if (_SafeStr_4814 != null)
            {
                if (((_SafeStr_4814.requestRoomObjectId == _arg_1) && (_SafeStr_4814.targetRoomObjectId == _arg_2)))
                {
                    removeBreedMonsterPlantsConfirmationView();
                };
            };
            if (_breedingConfirmationAlert != null)
            {
                _breedingConfirmationAlert.dispose();
            };
        }

        public function cancelBreedingPets(_arg_1:int, _arg_2:int):void
        {
            if (_SafeStr_4814 != null)
            {
                if (((_SafeStr_4814.requestRoomObjectId == _arg_1) && (_SafeStr_4814.targetRoomObjectId == _arg_2)))
                {
                    removeBreedMonsterPlantsConfirmationView();
                };
            };
            removeBreedingPetsWaitingConfirmationAlert();
            windowManager.alert("${breedpets.cancel.notification.title}", "${breedpets.cancel.notification.text}", 0, onBreedingAlert);
        }

        public function onBreedingAlert(_arg_1:_SafeStr_3114, _arg_2:_SafeStr_3116):void
        {
            if (((_arg_2.type == "WE_OK") || (_arg_2.type == "WE_CANCEL")))
            {
                _arg_1.dispose();
            };
        }

        public function showBreedMonsterPlantsConfirmationView(_arg_1:int, _arg_2:int, _arg_3:Boolean):void
        {
            if (!_SafeStr_4814)
            {
                _SafeStr_4814 = new BreedMonsterPlantsConfirmationView(this);
            };
            _SafeStr_4814.open(_arg_1, _arg_2, _arg_3);
        }

        public function showConfirmPetBreedingView(_arg_1:ConfirmPetBreedingPetData, _arg_2:ConfirmPetBreedingPetData, _arg_3:int, _arg_4:Array, _arg_5:int):void
        {
            if (!_SafeStr_4815)
            {
                _SafeStr_4815 = new ConfirmPetBreedingView(this);
            };
            var _local_6:int = findPetRoomObjectIdByWebId(_arg_1.webId);
            var _local_7:int = findPetRoomObjectIdByWebId(_arg_2.webId);
            _SafeStr_4815.open(_local_6, _local_7, _arg_3, _arg_4, _arg_5, _arg_1.level, _arg_2.level);
        }

        private function removeBreedMonsterPlantsConfirmationView():void
        {
            if (_SafeStr_4814)
            {
                _SafeStr_4814.dispose();
                _SafeStr_4814 = null;
            };
        }

        private function removeConfirmPetBreedingView():void
        {
            if (_SafeStr_4815)
            {
                _SafeStr_4815.dispose();
                _SafeStr_4815 = null;
            };
        }

        public function showBreedPetsResultView(_arg_1:BreedPetsResultData, _arg_2:BreedPetsResultData):void
        {
            if (!_SafeStr_4817)
            {
                _SafeStr_4817 = new BreedPetsResultView(this);
            };
            _SafeStr_4817.open(_arg_1, _arg_2);
        }

        public function removeBreedPetsResultView(_arg_1:BreedPetsResultView):void
        {
            if (_arg_1 != null)
            {
                if (_arg_1 == _SafeStr_4817)
                {
                    _SafeStr_4817.dispose();
                    _SafeStr_4817 = null;
                }
                else
                {
                    _arg_1.dispose();
                };
            };
        }

        private function findCurrentUserRoomObject():IRoomObject
        {
            var _local_4:int;
            var _local_2:* = null;
            var _local_1:* = null;
            var _local_5:int = handler.container.sessionDataManager.userId;
            var _local_6:int = handler.roomEngine.activeRoomId;
            var _local_7:int = 100;
            var _local_3:int = handler.roomEngine.getRoomObjectCount(_local_6, _local_7);
            _local_4 = 0;
            while (_local_4 < _local_3)
            {
                _local_2 = handler.roomEngine.getRoomObjectWithIndex(_local_6, _local_4, 100);
                if (_local_2 != null)
                {
                    _local_1 = handler.roomSession.userDataManager.getUserDataByIndex(_local_2.getId());
                    if (_local_1 != null)
                    {
                        if (_local_1.webID == _local_5)
                        {
                            return (_local_2);
                        };
                    };
                };
                _local_4++;
            };
            return (null);
        }

        internal function get isUserDecorating():Boolean
        {
            return (handler.roomSession.isUserDecorating);
        }

        internal function set isUserDecorating(_arg_1:Boolean):void
        {
            var _local_5:int;
            var _local_4:* = null;
            var _local_2:int;
            var _local_3:* = null;
            handler.roomSession.isUserDecorating = _arg_1;
            if (_arg_1)
            {
                _local_5 = handler.container.sessionDataManager.userId;
                if (!_SafeStr_4823)
                {
                    _local_4 = handler.container.sessionDataManager.userName;
                    _local_2 = handler.container.roomSession.ownUserRoomId;
                    _SafeStr_4823 = new DecorateModeView(this, _local_5, _local_4, _local_2);
                };
                _SafeStr_4823.show();
                _local_3 = (messageListener.processWidgetMessage(new RoomWidgetGetObjectLocationMessage("RWGOI_MESSAGE_GET_OBJECT_LOCATION", _local_5, 1)) as RoomWidgetUserLocationUpdateEvent);
                if (_local_3)
                {
                    _SafeStr_4823.update(_local_3.rectangle, _local_3.screenLocation, 0);
                };
            }
            else
            {
                if (_SafeStr_4823)
                {
                    _SafeStr_4823.hide(false);
                };
            };
        }

        public function get catalog():IHabboCatalog
        {
            return (_catalog);
        }

        public function isMonsterPlant():Boolean
        {
            if (_SafeStr_4828 != null)
            {
                return (_SafeStr_4828.petType == 16);
            };
            return (false);
        }

        public function cancelBreedPets(_arg_1:int, _arg_2:int):void
        {
            var _local_3:_SafeStr_3241 = handler.container.roomSession.userDataManager.getUserDataByIndex(_arg_1);
            var _local_4:_SafeStr_3241 = handler.container.roomSession.userDataManager.getUserDataByIndex(_arg_2);
            if (((_local_3) && (_local_4)))
            {
                handler.container.connection.send(new _SafeStr_677(1, _local_3.webID, _local_4.webID));
            };
        }

        public function acceptBreedPets(_arg_1:int, _arg_2:int):void
        {
            var _local_3:_SafeStr_3241 = handler.container.roomSession.userDataManager.getUserDataByIndex(_arg_1);
            var _local_4:_SafeStr_3241 = handler.container.roomSession.userDataManager.getUserDataByIndex(_arg_2);
            if (((_local_3) && (_local_4)))
            {
                handler.container.connection.send(new _SafeStr_677(2, _local_3.webID, _local_4.webID));
            };
        }

        public function breedPets(_arg_1:int, _arg_2:int):void
        {
            var _local_3:_SafeStr_3241 = handler.container.roomSession.userDataManager.getUserDataByIndex(_arg_1);
            var _local_4:_SafeStr_3241 = handler.container.roomSession.userDataManager.getUserDataByIndex(_arg_2);
            if (((_local_3) && (_local_4)))
            {
                handler.container.connection.send(new _SafeStr_677(0, _local_3.webID, _local_4.webID));
            };
        }

        public function openBotSkillConfigurationView(_arg_1:int, _arg_2:int, _arg_3:Point=null):void
        {
            if (!_SafeStr_4824.hasKey(_arg_2))
            {
                switch (_arg_2)
                {
                    case 2:
                        _SafeStr_4824.add(2, new BotChatterMarkovConfiguration(this));
                        break;
                    case 5:
                        _SafeStr_4824.add(5, new BotChangeNameConfiguration(this));
                        break;
                    default:
                        return;
                };
            };
            var _local_4:_SafeStr_3297 = _SafeStr_4824.getValue(_arg_2);
            _local_4.open(_arg_1, _arg_3);
        }

        public function cancelPetBreeding(_arg_1:int):void
        {
            handler.container.connection.send(new _SafeStr_926(_arg_1));
        }

        public function confirmPetBreeding(_arg_1:int, _arg_2:String, _arg_3:int, _arg_4:int):void
        {
            handler.container.connection.send(new _SafeStr_423(_arg_1, _arg_2, _arg_3, _arg_4));
        }

        public function showNestBreedingSuccess(_arg_1:int, _arg_2:int):void
        {
            if (_SafeStr_4837 == null)
            {
                _SafeStr_4837 = new NestBreedingSuccessView(this);
            };
            var _local_3:int = findPetRoomObjectIdByWebId(_arg_1);
            (trace(_arg_1, _arg_2));
            _SafeStr_4837.open(_local_3, _arg_2);
        }

        public function get friendList():_SafeStr_1874
        {
            return (handler.friendList);
        }


    }
}//package com.sulake.habbo.ui.widget.avatarinfo

// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_1874 = "_-41C" (String#2525, DoABC#4)
// _SafeStr_19 = "_-01r" (String#1323, DoABC#4)
// _SafeStr_20 = "_-W1o" (String#542, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3114 = "_-b1E" (String#1258, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3149 = "_-qk" (String#4158, DoABC#4)
// _SafeStr_3241 = "_-O1A" (String#764, DoABC#4)
// _SafeStr_3271 = "_-z1P" (String#7829, DoABC#4)
// _SafeStr_3297 = "_-v1X" (String#14409, DoABC#4)
// _SafeStr_3344 = "_-f1h" (String#7944, DoABC#4)
// _SafeStr_3363 = "_-bv" (String#6134, DoABC#4)
// _SafeStr_3710 = "_-Ki" (String#3194, DoABC#4)
// _SafeStr_3882 = "_-D10" (String#53, DoABC#4)
// _SafeStr_3883 = "_-w1c" (String#683, DoABC#4)
// _SafeStr_3914 = "_-w1m" (String#1204, DoABC#4)
// _SafeStr_4020 = "_-el" (String#1659, DoABC#4)
// _SafeStr_41 = "_-m5" (String#2087, DoABC#4)
// _SafeStr_4147 = "_-Q1a" (String#196, DoABC#4)
// _SafeStr_423 = "_-12N" (String#30985, DoABC#4)
// _SafeStr_4503 = "_-zv" (String#9515, DoABC#4)
// _SafeStr_4812 = "_-81G" (String#4651, DoABC#4)
// _SafeStr_4813 = "_-2A" (String#5148, DoABC#4)
// _SafeStr_4814 = "_-to" (String#4338, DoABC#4)
// _SafeStr_4815 = "_-X3" (String#5260, DoABC#4)
// _SafeStr_4816 = "_-w1V" (String#4268, DoABC#4)
// _SafeStr_4817 = "_-F3" (String#4117, DoABC#4)
// _SafeStr_4818 = "_-NR" (String#5531, DoABC#4)
// _SafeStr_4819 = "_-N1J" (String#6590, DoABC#4)
// _SafeStr_4820 = "_-b1H" (String#6746, DoABC#4)
// _SafeStr_4821 = "_-9q" (String#6845, DoABC#4)
// _SafeStr_4822 = "_-aT" (String#6768, DoABC#4)
// _SafeStr_4823 = "_-d1f" (String#4105, DoABC#4)
// _SafeStr_4824 = "_-t13" (String#5585, DoABC#4)
// _SafeStr_4825 = "_-1B" (String#7092, DoABC#4)
// _SafeStr_4826 = "_-Y1e" (String#7722, DoABC#4)
// _SafeStr_4827 = "_-iC" (String#13117, DoABC#4)
// _SafeStr_4828 = "_-l1w" (String#4954, DoABC#4)
// _SafeStr_4829 = "_-01v" (String#12022, DoABC#4)
// _SafeStr_4830 = "_-kp" (String#3752, DoABC#4)
// _SafeStr_4831 = "_-6r" (String#10858, DoABC#4)
// _SafeStr_4832 = "_-a11" (String#10888, DoABC#4)
// _SafeStr_4833 = "_-Fx" (String#30665, DoABC#4)
// _SafeStr_4834 = "_-un" (String#8570, DoABC#4)
// _SafeStr_4835 = "_-aK" (String#10271, DoABC#4)
// _SafeStr_4836 = "_-Vb" (String#12104, DoABC#4)
// _SafeStr_4837 = "_-Xi" (String#14589, DoABC#4)
// _SafeStr_677 = "_-Q4" (String#13332, DoABC#4)
// _SafeStr_8949 = "_-U1A" (String#36200, DoABC#4)
// _SafeStr_8950 = "_-Wk" (String#31929, DoABC#4)
// _SafeStr_8951 = "_-g1M" (String#38423, DoABC#4)
// _SafeStr_926 = "_-Zd" (String#28547, DoABC#4)


