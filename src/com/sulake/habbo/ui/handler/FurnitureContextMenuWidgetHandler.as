// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.handler.FurnitureContextMenuWidgetHandler

package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.widget.furniture.contextmenu.FurnitureContextMenuWidget;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.ui.widget.furniture.mysterybox.MysteryBoxToolbarExtension;
    import com.sulake.habbo.room.IRoomEngine;
    import _-81g._SafeStr_795;
    import com.sulake.habbo.session.IRoomSession;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.habbo.session.furniture._SafeStr_3130;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetUseProductMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import com.sulake.habbo.room.events.RoomEngineToWidgetEvent;
    import flash.events.Event;
    import flash.geom.Rectangle;
    import flash.geom.Point;
    import _-XO._SafeStr_312;
    import com.sulake.habbo.room.events.RoomEngineObjectEvent;

    public class FurnitureContextMenuWidgetHandler implements IRoomWidgetHandler 
    {

        private var _disposed:Boolean = false;
        private var _container:IRoomWidgetHandlerContainer = null;
        private var _SafeStr_4981:FurnitureContextMenuWidget;
        private var _connection:IConnection;
        private var _SafeStr_5644:IMessageEvent = null;
        private var _mysteryBoxToolbarExtension:MysteryBoxToolbarExtension;

        public function FurnitureContextMenuWidgetHandler()
        {
            _mysteryBoxToolbarExtension = new MysteryBoxToolbarExtension(this);
        }

        public function dispose():void
        {
            if (!_disposed)
            {
                if (_mysteryBoxToolbarExtension != null)
                {
                    _mysteryBoxToolbarExtension.dispose();
                    _mysteryBoxToolbarExtension = null;
                };
                unsetContainer();
                if (((!(_connection == null)) && (_SafeStr_5644)))
                {
                    _connection.removeMessageEvent(_SafeStr_5644);
                    _SafeStr_5644 = null;
                };
                _connection = null;
                _SafeStr_4981 = null;
            };
            _disposed = true;
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function get type():String
        {
            return (null);
        }

        public function get roomEngine():IRoomEngine
        {
            return ((_container) ? _container.roomEngine : null);
        }

        private function unsetContainer():void
        {
            if (_container != null)
            {
                _container.roomEngine.events.removeEventListener("ROWRE_REQUEST_MONSTERPLANT_SEED_PLANT_CONFIRMATION_DIALOG", onMonsterPlantSeedPlantConfirmationDialogRequested);
                _container.roomEngine.events.removeEventListener("ROWRE_REQUEST_PURCHASABLE_CLOTHING_CONFIRMATION_DIALOG", onPurchasableClothingConfirmationDialogRequested);
                _container.roomEngine.events.removeEventListener("RETWE_REQUEST_MYSTERYBOX_OPEN_DIALOG", onMysteryBoxOpenDialogRequested);
                _container.roomEngine.events.removeEventListener("RETWE_REQUEST_EFFECTBOX_OPEN_DIALOG", onEffectBoxOpenDialogRequested);
                _container.roomEngine.events.removeEventListener("RETWE_REQUEST_MYSTERYTROPHY_OPEN_DIALOG", onMysteryTrophyOpenDialogRequested);
            };
            _container = null;
        }

        public function set container(_arg_1:IRoomWidgetHandlerContainer):void
        {
            unsetContainer();
            _container = _arg_1;
            if (_arg_1 == null)
            {
                return;
            };
            if (_container.roomEngine != null)
            {
                _container.roomEngine.events.addEventListener("ROWRE_REQUEST_MONSTERPLANT_SEED_PLANT_CONFIRMATION_DIALOG", onMonsterPlantSeedPlantConfirmationDialogRequested);
                _container.roomEngine.events.addEventListener("ROWRE_REQUEST_PURCHASABLE_CLOTHING_CONFIRMATION_DIALOG", onPurchasableClothingConfirmationDialogRequested);
                _container.roomEngine.events.addEventListener("RETWE_REQUEST_MYSTERYBOX_OPEN_DIALOG", onMysteryBoxOpenDialogRequested);
                _container.roomEngine.events.addEventListener("RETWE_REQUEST_EFFECTBOX_OPEN_DIALOG", onEffectBoxOpenDialogRequested);
                _container.roomEngine.events.addEventListener("RETWE_REQUEST_MYSTERYTROPHY_OPEN_DIALOG", onMysteryTrophyOpenDialogRequested);
            };
        }

        public function set widget(_arg_1:FurnitureContextMenuWidget):void
        {
            _SafeStr_4981 = _arg_1;
            if (_container.config.getBoolean("mysterybox.tracker.active"))
            {
                _mysteryBoxToolbarExtension.createWindow();
            };
        }

        public function set connection(_arg_1:IConnection):void
        {
            _connection = _arg_1;
            if (!_SafeStr_5644)
            {
                _SafeStr_5644 = new _SafeStr_795(onGuildFurniContextMenuInfo);
                _connection.addMessageEvent(_SafeStr_5644);
            };
        }

        public function get roomSession():IRoomSession
        {
            return ((_container) ? _container.roomSession : null);
        }

        public function getFurniData(_arg_1:IRoomObject):_SafeStr_3130
        {
            var _local_2:* = null;
            var _local_3:int;
            if (_arg_1)
            {
                _local_3 = _arg_1.getModel().getNumber("furniture_type_id");
                _local_2 = _container.sessionDataManager.getFloorItemData(_local_3);
            };
            return (_local_2);
        }

        public function getWidgetMessages():Array
        {
            return (["RWUPM_MONSTERPLANT_SEED"]);
        }

        public function processWidgetMessage(_arg_1:RoomWidgetMessage):RoomWidgetUpdateEvent
        {
            var _local_2:* = null;
            if (!_arg_1)
            {
                return (null);
            };
            switch (_arg_1.type)
            {
                case "RWUPM_MONSTERPLANT_SEED":
                    _local_2 = (_arg_1 as RoomWidgetUseProductMessage);
                    if (_local_2)
                    {
                        _container.roomSession.plantSeed(_local_2.roomObjectId);
                    };
                    break;
                default:
            };
            return (null);
        }

        public function getProcessedEvents():Array
        {
            return (["RETWE_OPEN_FURNI_CONTEXT_MENU", "RETWE_CLOSE_FURNI_CONTEXT_MENU"]);
        }

        public function processEvent(_arg_1:Event):void
        {
            if (_SafeStr_4981 == null)
            {
                return;
            };
            var _local_3:RoomEngineToWidgetEvent = (_arg_1 as RoomEngineToWidgetEvent);
            if (_local_3 == null)
            {
                return;
            };
            var _local_2:IRoomObject = getRoomObject(_local_3.objectId);
            if (_local_2 == null)
            {
                return;
            };
            switch (_arg_1.type)
            {
                case "RETWE_OPEN_FURNI_CONTEXT_MENU":
                    switch (_local_3.contextMenu)
                    {
                        case "FRIEND_FURNITURE":
                            _SafeStr_4981.showFriendFurnitureContextMenu(_local_2);
                            break;
                        case "MONSTERPLANT_SEED":
                            if (_container.isOwnerOfFurniture(_local_2))
                            {
                                _SafeStr_4981.showMonsterPlantSeedContextMenu(_local_2, _local_3.category);
                            };
                            break;
                        case "MYSTERY_BOX":
                            _SafeStr_4981.showMysteryBoxContextMenu(_local_2);
                            break;
                        case "RANDOM_TELEPORT":
                            _SafeStr_4981.showRandomTeleportContextMenu(_local_2, _local_3.category);
                            break;
                        case "PURCHASABLE_CLOTHING":
                            _SafeStr_4981.showUsableFurnitureContextMenu(_local_2, _local_3.category);
                    };
                    return;
                case "RETWE_CLOSE_FURNI_CONTEXT_MENU":
                    _SafeStr_4981.hideContextMenu(_local_2);
                    return;
            };
        }

        public function update():void
        {
        }

        public function getObjectRectangle(_arg_1:int):Rectangle
        {
            return (_container.roomEngine.getRoomObjectBoundingRectangle(_container.roomSession.roomId, _arg_1, 10, _container.getFirstCanvasId()));
        }

        public function getObjectScreenLocation(_arg_1:int):Point
        {
            return (_container.roomEngine.getRoomObjectScreenLocation(_container.roomSession.roomId, _arg_1, 10, _container.getFirstCanvasId()));
        }

        public function sendGoToHomeRoomMessage(_arg_1:int):void
        {
            _container.navigator.goToPrivateRoom(_arg_1);
        }

        public function sendJoinToGroupMessage(_arg_1:int):void
        {
            _connection.send(new _SafeStr_312(_arg_1));
        }

        private function getRoomObject(_arg_1:int):IRoomObject
        {
            if (_container == null)
            {
                return (null);
            };
            return (_container.roomEngine.getRoomObject(_container.roomSession.roomId, _arg_1, 10));
        }

        private function onGuildFurniContextMenuInfo(_arg_1:_SafeStr_795):void
        {
            var _local_2:* = null;
            var _local_3:* = null;
            if (_SafeStr_4981 != null)
            {
                _local_2 = _arg_1.getParser();
                _local_3 = getRoomObject(_local_2.objectId);
                if (_local_3 != null)
                {
                    _SafeStr_4981.showGuildFurnitureContextMenu(_local_3, _local_2.guildId, _local_2.guildName, _local_2.guildHomeRoomId, _local_2.userIsMember, _local_2.guildHasReadableForum);
                };
            };
        }

        private function onMonsterPlantSeedPlantConfirmationDialogRequested(_arg_1:RoomEngineObjectEvent):void
        {
            var _local_3:* = null;
            var _local_2:Boolean;
            if (_SafeStr_4981 != null)
            {
                _local_3 = getRoomObject(_arg_1.objectId);
                if (_local_3 != null)
                {
                    _local_2 = _container.isOwnerOfFurniture(_local_3);
                    if (!_local_2)
                    {
                        return;
                    };
                    _SafeStr_4981.showPlantSeedConfirmationDialog(_local_3);
                };
            };
        }

        private function onPurchasableClothingConfirmationDialogRequested(_arg_1:RoomEngineObjectEvent):void
        {
            var _local_3:* = null;
            var _local_2:Boolean;
            if (_SafeStr_4981 != null)
            {
                _local_3 = getRoomObject(_arg_1.objectId);
                if (_local_3 != null)
                {
                    _local_2 = _container.isOwnerOfFurniture(_local_3);
                    if (!_local_2)
                    {
                        return;
                    };
                    _SafeStr_4981.showPurchasableClothingConfirmationDialog(_local_3);
                };
            };
        }

        private function onEffectBoxOpenDialogRequested(_arg_1:RoomEngineObjectEvent):void
        {
            var _local_3:* = null;
            var _local_2:Boolean;
            if (_SafeStr_4981 != null)
            {
                _local_3 = getRoomObject(_arg_1.objectId);
                if (_local_3 != null)
                {
                    _local_2 = _container.isOwnerOfFurniture(_local_3);
                    if (!_local_2)
                    {
                        return;
                    };
                    _SafeStr_4981.showEffectBoxOpenDialog(_local_3);
                };
            };
        }

        private function onMysteryTrophyOpenDialogRequested(_arg_1:RoomEngineObjectEvent):void
        {
            var _local_3:* = null;
            var _local_2:Boolean;
            if (_SafeStr_4981 != null)
            {
                _local_3 = getRoomObject(_arg_1.objectId);
                if (_local_3 != null)
                {
                    _local_2 = _container.isOwnerOfFurniture(_local_3);
                    if (!_local_2)
                    {
                        return;
                    };
                    _SafeStr_4981.showMysteryTrophyOpenDialog(_local_3);
                };
            };
        }

        private function onMysteryBoxOpenDialogRequested(_arg_1:RoomEngineObjectEvent):void
        {
            var _local_2:* = null;
            if (_SafeStr_4981 != null)
            {
                _local_2 = getRoomObject(_arg_1.objectId);
                if (_local_2 != null)
                {
                    _SafeStr_4981.showMysteryBoxOpenDialog(_local_2);
                };
            };
        }

        public function get container():IRoomWidgetHandlerContainer
        {
            return (_container);
        }

        public function get widget():FurnitureContextMenuWidget
        {
            return (_SafeStr_4981);
        }


    }
}//package com.sulake.habbo.ui.handler

// _SafeStr_1156 = "_-uY" (String#31606, DoABC#4)
// _SafeStr_312 = "_-18" (String#13699, DoABC#4)
// _SafeStr_3130 = "_-fG" (String#751, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_5644 = "_-Ay" (String#8384, DoABC#4)
// _SafeStr_795 = "_-KL" (String#23456, DoABC#4)


