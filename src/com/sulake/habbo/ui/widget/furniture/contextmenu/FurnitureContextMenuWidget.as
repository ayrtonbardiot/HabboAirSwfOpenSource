// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.furniture.contextmenu.FurnitureContextMenuWidget

package com.sulake.habbo.ui.widget.furniture.contextmenu
{
    import com.sulake.habbo.ui.widget.RoomWidgetBase;
    import com.sulake.habbo.ui.widget.contextmenu._SafeStr_3149;
    import com.sulake.core.runtime._SafeStr_41;
    import com.sulake.core.runtime._SafeStr_20;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.habbo.ui.widget.furniture.guildfurnicontextmenu.GuildFurnitureContextMenuView;
    import com.sulake.habbo.ui.widget.furniture.effectbox.EffectBoxOpenDialogView;
    import com.sulake.habbo.ui.widget.furniture.mysterybox.MysteryBoxContextMenuView;
    import com.sulake.habbo.ui.widget.furniture.mysterytrophy.MysteryTrophyOpenDialogView;
    import com.sulake.habbo.ui.widget.furniture.mysterybox.MysteryBoxOpenDialogView;
    import com.sulake.habbo.ui.widget.furniture.friendfurni.FriendFurniContextMenuView;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.core.runtime._SafeStr_19;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.habbo.groups._SafeStr_1757;
    import com.sulake.habbo.ui.handler.FurnitureContextMenuWidgetHandler;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.ui.widget.contextmenu.ContextInfoView;
    import com.sulake.habbo.room.events.RoomEngineObjectEvent;
    import com.sulake.habbo.friendlist._SafeStr_1874;

    public class FurnitureContextMenuWidget extends RoomWidgetBase implements _SafeStr_3149, _SafeStr_41 
    {

        private var _SafeStr_4147:_SafeStr_20;
        private var _SafeStr_3882:FurnitureContextInfoView;
        private var _selectedObject:IRoomObject = null;
        private var _SafeStr_4321:GuildFurnitureContextMenuView;
        private var _SafeStr_4322:RandomTeleportContextMenuView;
        private var _SafeStr_4323:MonsterPlantSeedContextMenuView;
        private var _SafeStr_4324:MonsterPlantSeedConfirmationView;
        private var _SafeStr_4329:EffectBoxOpenDialogView;
        private var _SafeStr_4325:MysteryBoxContextMenuView;
        private var _SafeStr_4330:MysteryTrophyOpenDialogView;
        private var _SafeStr_4326:MysteryBoxOpenDialogView;
        private var _SafeStr_4327:FriendFurniContextMenuView;
        private var _SafeStr_4328:GenericUsableFurnitureContextMenuView;
        private var _catalog:IHabboCatalog;
        private var _container:IRoomWidgetHandlerContainer = null;
        private var _SafeStr_4331:PurchasableClothingConfirmationView;

        public function FurnitureContextMenuWidget(_arg_1:IRoomWidgetHandler, _arg_2:_SafeStr_1695, _arg_3:_SafeStr_21, _arg_4:_SafeStr_19, _arg_5:_SafeStr_18, _arg_6:_SafeStr_20, _arg_7:_SafeStr_1757, _arg_8:IHabboCatalog)
        {
            super(_arg_1, _arg_2, _arg_3, _arg_5);
            _SafeStr_4147 = _arg_6;
            _SafeStr_4321 = new GuildFurnitureContextMenuView(this, _arg_7, _arg_2);
            _SafeStr_4322 = new RandomTeleportContextMenuView(this);
            _SafeStr_4323 = new MonsterPlantSeedContextMenuView(this);
            _SafeStr_4325 = new MysteryBoxContextMenuView(this);
            _SafeStr_4327 = new FriendFurniContextMenuView(this);
            _SafeStr_4328 = new GenericUsableFurnitureContextMenuView(this);
            _SafeStr_4324 = new MonsterPlantSeedConfirmationView(this);
            _SafeStr_4326 = new MysteryBoxOpenDialogView(this);
            _SafeStr_4329 = new EffectBoxOpenDialogView(this);
            _SafeStr_4330 = new MysteryTrophyOpenDialogView(this);
            _SafeStr_4331 = new PurchasableClothingConfirmationView(this);
            _catalog = _arg_8;
            this.handler.widget = this;
            this.handler.roomEngine.events.addEventListener("REOE_REMOVED", onRoomObjectRemoved);
        }

        override public function dispose():void
        {
            if (disposed)
            {
                return;
            };
            _SafeStr_4147.removeUpdateReceiver(this);
            removeView(_SafeStr_3882, false);
            _SafeStr_4321.dispose();
            _SafeStr_4321 = null;
            _SafeStr_4322.dispose();
            _SafeStr_4322 = null;
            _SafeStr_4323.dispose();
            _SafeStr_4323 = null;
            _SafeStr_4324.dispose();
            _SafeStr_4324 = null;
            _SafeStr_4325.dispose();
            _SafeStr_4325 = null;
            _SafeStr_4326.dispose();
            _SafeStr_4326 = null;
            _SafeStr_4327.dispose();
            _SafeStr_4327 = null;
            _SafeStr_4328.dispose();
            _SafeStr_4328 = null;
            _SafeStr_4329.dispose();
            _SafeStr_4329 = null;
            _SafeStr_4330.dispose();
            _SafeStr_4330 = null;
            _SafeStr_4331.dispose();
            _SafeStr_4331 = null;
            _catalog = null;
            super.dispose();
        }

        public function set container(_arg_1:IRoomWidgetHandlerContainer):void
        {
            _container = _arg_1;
        }

        public function get container():IRoomWidgetHandlerContainer
        {
            return (_container);
        }

        public function get handler():FurnitureContextMenuWidgetHandler
        {
            return (_SafeStr_3914 as FurnitureContextMenuWidgetHandler);
        }

        public function get roomEngine():IRoomEngine
        {
            return ((_container) ? _container.roomEngine : null);
        }

        public function hideContextMenu(_arg_1:IRoomObject):void
        {
            if (((!(_selectedObject == null)) && (_selectedObject.getId() == _arg_1.getId())))
            {
                removeView(_SafeStr_3882, false);
                _SafeStr_4147.removeUpdateReceiver(this);
                _selectedObject = null;
            };
        }

        public function showGuildFurnitureContextMenu(_arg_1:IRoomObject, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:Boolean, _arg_6:Boolean):void
        {
            _selectedObject = _arg_1;
            _SafeStr_4321._SafeStr_4332 = _arg_2;
            _SafeStr_4321._SafeStr_4333 = _arg_4;
            _SafeStr_4321._SafeStr_4334 = _arg_5;
            _SafeStr_4321._SafeStr_4335 = _arg_6;
            if (_SafeStr_3882 != null)
            {
                removeView(_SafeStr_3882, false);
            };
            _SafeStr_3882 = _SafeStr_4321;
            FurnitureContextInfoView.setup(_SafeStr_3882, _arg_1, _arg_3);
            _SafeStr_4147.registerUpdateReceiver(this, 10);
        }

        public function showRandomTeleportContextMenu(_arg_1:IRoomObject, _arg_2:int):void
        {
            _selectedObject = _arg_1;
            if (_SafeStr_3882 != null)
            {
                removeView(_SafeStr_3882, false);
            };
            _SafeStr_4322.objectCategory = _arg_2;
            _SafeStr_3882 = _SafeStr_4322;
            FurnitureContextInfoView.setup(_SafeStr_3882, _arg_1);
            _SafeStr_4147.registerUpdateReceiver(this, 10);
        }

        public function showMonsterPlantSeedContextMenu(_arg_1:IRoomObject, _arg_2:int):void
        {
            _selectedObject = _arg_1;
            if (_SafeStr_3882 != null)
            {
                removeView(_SafeStr_3882, false);
            };
            _SafeStr_4323.objectCategory = _arg_2;
            _SafeStr_3882 = _SafeStr_4323;
            FurnitureContextInfoView.setup(_SafeStr_3882, _arg_1);
            _SafeStr_4147.registerUpdateReceiver(this, 10);
        }

        public function showPlantSeedConfirmationDialog(_arg_1:IRoomObject):void
        {
            _selectedObject = _arg_1;
            if (_SafeStr_3882 != null)
            {
                removeView(_SafeStr_3882, false);
            };
            if (!_SafeStr_4324)
            {
                _SafeStr_4324 = new MonsterPlantSeedConfirmationView(this);
            };
            _SafeStr_4324.open(_arg_1.getId());
        }

        public function showPurchasableClothingConfirmationDialog(_arg_1:IRoomObject):void
        {
            _selectedObject = _arg_1;
            if (_SafeStr_3882 != null)
            {
                removeView(_SafeStr_3882, false);
            };
            if (!_SafeStr_4331)
            {
                _SafeStr_4331 = new PurchasableClothingConfirmationView(this);
            };
            _SafeStr_4331.open(_arg_1.getId());
        }

        public function showEffectBoxOpenDialog(_arg_1:IRoomObject):void
        {
            _selectedObject = _arg_1;
            if (_SafeStr_3882 != null)
            {
                removeView(_SafeStr_3882, false);
            };
            if (!_SafeStr_4329)
            {
                _SafeStr_4329 = new EffectBoxOpenDialogView(this);
            };
            _SafeStr_4329.open(_arg_1.getId());
        }

        public function showMysteryTrophyOpenDialog(_arg_1:IRoomObject):void
        {
            _selectedObject = _arg_1;
            if (_SafeStr_3882 != null)
            {
                removeView(_SafeStr_3882, false);
            };
            if (!_SafeStr_4330)
            {
                _SafeStr_4330 = new MysteryTrophyOpenDialogView(this);
            };
            _SafeStr_4330.open(_arg_1.getId());
        }

        private function removePlantSeedConfirmationView():void
        {
            if (_SafeStr_4324 != null)
            {
                _SafeStr_4324.close();
            };
        }

        public function showMysteryBoxContextMenu(_arg_1:IRoomObject):void
        {
            _selectedObject = _arg_1;
            if (_SafeStr_3882 != null)
            {
                removeView(_SafeStr_3882, false);
            };
            if (_SafeStr_4325 == null)
            {
                _SafeStr_4325 = new MysteryBoxContextMenuView(this);
            };
            _SafeStr_4325.isOwnerMode = handler.container.isOwnerOfFurniture(_arg_1);
            _SafeStr_4325.show();
            _SafeStr_3882 = _SafeStr_4325;
            FurnitureContextInfoView.setup(_SafeStr_3882, _arg_1);
            _SafeStr_4147.registerUpdateReceiver(this, 10);
        }

        public function showFriendFurnitureContextMenu(_arg_1:IRoomObject):void
        {
            _selectedObject = _arg_1;
            if (_SafeStr_3882 != null)
            {
                removeView(_SafeStr_3882, false);
            };
            if (_SafeStr_4327 == null)
            {
                _SafeStr_4327 = new FriendFurniContextMenuView(this);
            };
            _SafeStr_4327.show();
            _SafeStr_3882 = _SafeStr_4327;
            FurnitureContextInfoView.setup(_SafeStr_3882, _arg_1);
            _SafeStr_4147.registerUpdateReceiver(this, 10);
        }

        public function showUsableFurnitureContextMenu(_arg_1:IRoomObject, _arg_2:int):void
        {
            _selectedObject = _arg_1;
            if (_SafeStr_3882 != null)
            {
                removeView(_SafeStr_3882, false);
            };
            if (_SafeStr_4328 == null)
            {
                _SafeStr_4328 = new GenericUsableFurnitureContextMenuView(this);
            };
            _SafeStr_4328.show();
            _SafeStr_4328.objectCategory = _arg_2;
            _SafeStr_3882 = _SafeStr_4328;
            FurnitureContextInfoView.setup(_SafeStr_3882, _arg_1);
            _SafeStr_4147.registerUpdateReceiver(this, 10);
        }

        public function showMysteryBoxOpenDialog(_arg_1:IRoomObject):void
        {
            _selectedObject = _arg_1;
            if (_SafeStr_3882 != null)
            {
                removeView(_SafeStr_3882, false);
            };
            _SafeStr_4326.startOpenFlow(_arg_1);
        }

        public function removeView(_arg_1:ContextInfoView, _arg_2:Boolean):void
        {
            if (_arg_1)
            {
                _arg_1.hide(false);
                if (_arg_1 == _SafeStr_3882)
                {
                    _SafeStr_3882 = null;
                };
            };
        }

        public function update(_arg_1:uint):void
        {
            if (((_SafeStr_3882) && (_selectedObject)))
            {
                _SafeStr_3882.update(this.handler.getObjectRectangle(_selectedObject.getId()), this.handler.getObjectScreenLocation(_selectedObject.getId()), _arg_1);
            };
        }

        public function get catalog():IHabboCatalog
        {
            return (_catalog);
        }

        private function onRoomObjectRemoved(_arg_1:RoomEngineObjectEvent):void
        {
            var _local_2:int;
            if (_arg_1.category == 10)
            {
                _local_2 = _arg_1.objectId;
                if (((!(_selectedObject == null)) && (_selectedObject.getId() == _local_2)))
                {
                    removeView(_SafeStr_3882, false);
                    removePlantSeedConfirmationView();
                    _SafeStr_4147.removeUpdateReceiver(this);
                    _selectedObject = null;
                };
            };
        }

        public function get friendList():_SafeStr_1874
        {
            return (null);
        }


    }
}//package com.sulake.habbo.ui.widget.furniture.contextmenu

// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_1757 = "_-h1P" (String#4520, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_1874 = "_-41C" (String#2525, DoABC#4)
// _SafeStr_19 = "_-01r" (String#1323, DoABC#4)
// _SafeStr_20 = "_-W1o" (String#542, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3149 = "_-qk" (String#4158, DoABC#4)
// _SafeStr_3882 = "_-D10" (String#53, DoABC#4)
// _SafeStr_3914 = "_-w1m" (String#1204, DoABC#4)
// _SafeStr_41 = "_-m5" (String#2087, DoABC#4)
// _SafeStr_4147 = "_-Q1a" (String#196, DoABC#4)
// _SafeStr_4321 = "_-De" (String#6895, DoABC#4)
// _SafeStr_4322 = "_-Ir" (String#9029, DoABC#4)
// _SafeStr_4323 = "_-41N" (String#9190, DoABC#4)
// _SafeStr_4324 = "_-l1u" (String#6303, DoABC#4)
// _SafeStr_4325 = "_-nl" (String#6139, DoABC#4)
// _SafeStr_4326 = "_-h1N" (String#11030, DoABC#4)
// _SafeStr_4327 = "_-323" (String#6708, DoABC#4)
// _SafeStr_4328 = "_-I17" (String#6301, DoABC#4)
// _SafeStr_4329 = "_-J16" (String#7154, DoABC#4)
// _SafeStr_4330 = "_-o4" (String#7681, DoABC#4)
// _SafeStr_4331 = "_-z1E" (String#7827, DoABC#4)
// _SafeStr_4332 = "_-lq" (String#5644, DoABC#4)
// _SafeStr_4333 = "_-uF" (String#23601, DoABC#4)
// _SafeStr_4334 = "_-YN" (String#19264, DoABC#4)
// _SafeStr_4335 = "_-z3" (String#23139, DoABC#4)


