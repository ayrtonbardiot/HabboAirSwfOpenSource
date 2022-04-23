// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.handler.CraftingWidgetHandler

package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.widget.crafting.CraftingWidget;
    import com.sulake.habbo.ui.RoomDesktop;
    import com.sulake.core.communication.messages.IMessageEvent;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.session.product._SafeStr_3182;
    import _-W1S._SafeStr_956;
    import _-W1S._SafeStr_702;
    import _-W1S._SafeStr_728;
    import _-W1S._SafeStr_651;
    import com.sulake.habbo.inventory.events.HabboInventoryFurniListParsedEvent;
    import _-FJ._SafeStr_398;
    import _-FJ._SafeStr_911;
    import _-FJ._SafeStr_836;
    import _-FJ._SafeStr_326;
    import _-FJ._SafeStr_835;
    import _-Go._SafeStr_330;
    import _-t8._SafeStr_265;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import com.sulake.habbo.room.events.RoomEngineToWidgetEvent;
    import com.sulake.room.object.IRoomObject;
    import flash.events.Event;

    public class CraftingWidgetHandler implements IRoomWidgetHandler 
    {

        private var _disposed:Boolean = false;
        private var _container:IRoomWidgetHandlerContainer;
        private var _SafeStr_4981:CraftingWidget;
        private var _SafeStr_5437:RoomDesktop;
        private var _SafeStr_6033:IMessageEvent;
        private var _messageEvents:Vector.<IMessageEvent>;
        private var _SafeStr_6031:int;
        private var _SafeStr_6030:Boolean;
        private var _SafeStr_6035:Boolean;
        private var _SafeStr_6034:Boolean;
        private var _SafeStr_6032:_SafeStr_3182;

        public function CraftingWidgetHandler(_arg_1:RoomDesktop)
        {
            _SafeStr_5437 = _arg_1;
        }

        public function dispose():void
        {
            removeMessageEvents();
            _SafeStr_4981 = null;
            _container = null;
            _SafeStr_5437 = null;
            _SafeStr_6032 = null;
            _disposed = true;
        }

        private function addMessageEvents():void
        {
            if (((!(_container)) || (!(_container.connection))))
            {
                return;
            };
            _messageEvents = new Vector.<IMessageEvent>(0);
            _messageEvents.push(new _SafeStr_956(onCraftableProductsMessage));
            _messageEvents.push(new _SafeStr_702(onCraftingRecipeMessage));
            _messageEvents.push(new _SafeStr_728(onCraftingResultMessage));
            _messageEvents.push(new _SafeStr_651(onCraftingRecipesAvailableMessage));
            for each (var _local_1:IMessageEvent in _messageEvents)
            {
                _container.connection.addMessageEvent(_local_1);
            };
        }

        private function removeMessageEvents():void
        {
            if ((((!(_container)) || (!(_container.connection))) || (!(_messageEvents))))
            {
                return;
            };
            for each (var _local_1:IMessageEvent in _messageEvents)
            {
                _container.connection.removeMessageEvent(_local_1);
                _local_1.dispose();
            };
            removeInventoryUpdateEvent();
            if (((_container.inventory) && (_container.inventory.events)))
            {
                _container.inventory.events.removeEventListener("HFLPE_FURNI_LIST_PARSED", onFurniListParsed);
            };
            _messageEvents = null;
        }

        public function initializeData():void
        {
            if (_SafeStr_6030)
            {
                return;
            };
            _SafeStr_6030 = true;
            if (_container.inventory.checkCategoryInitilization("furni"))
            {
                getCraftableProducts();
            };
        }

        private function onFurniListParsed(_arg_1:HabboInventoryFurniListParsedEvent):void
        {
            if (((_SafeStr_6030) && (_arg_1.category == "furni")))
            {
                getCraftableProducts();
            };
        }

        private function getCraftableProducts():void
        {
            _container.connection.send(new _SafeStr_398(_SafeStr_6031));
        }

        private function onCraftableProductsMessage(_arg_1:_SafeStr_956):void
        {
            _SafeStr_6030 = false;
            if (!_SafeStr_4981)
            {
                return;
            };
            if (!_arg_1.getParser().hasData())
            {
                _SafeStr_4981.hide();
                return;
            };
            _SafeStr_4981.showWidget();
            _SafeStr_4981.showCraftingCategories(_arg_1.getParser().recipeProductItems, _arg_1.getParser().usableInventoryFurniClasses, _container.roomEngine, _container.sessionDataManager);
            _SafeStr_6035 = false;
        }

        public function getCraftingRecipe(_arg_1:String):void
        {
            _SafeStr_6032 = _container.sessionDataManager.getProductData(_arg_1);
            _container.connection.send(new _SafeStr_911(_arg_1));
        }

        private function onCraftingRecipeMessage(_arg_1:_SafeStr_702):void
        {
            _SafeStr_4981.showCraftingRecipe(_arg_1.getParser().ingredients);
        }

        public function getCraftingRecipesAvailable(_arg_1:Vector.<int>):void
        {
            _container.connection.send(new _SafeStr_836(_SafeStr_6031, _arg_1));
        }

        private function onCraftingRecipesAvailableMessage(_arg_1:_SafeStr_651):void
        {
            _SafeStr_4981.infoCtrl.craftingSecretRecipesAvailable(_arg_1.getParser().count, _arg_1.getParser().recipeComplete);
        }

        public function doCraftingWithRecipe():void
        {
            if (!_SafeStr_6032)
            {
                return;
            };
            _SafeStr_4981.infoCtrl.setState(1000);
            registerForFurniListInvalidate();
            _container.connection.send(new _SafeStr_326(_SafeStr_6031, _SafeStr_6032.type));
        }

        public function doCraftingWithMixer():void
        {
            _SafeStr_4981.infoCtrl.setState(1000);
            var _local_1:Vector.<int> = _SafeStr_4981.getSelectedIngredients();
            registerForFurniListInvalidate();
            _container.connection.send(new _SafeStr_835(_SafeStr_6031, _local_1));
        }

        private function onCraftingResultMessage(_arg_1:_SafeStr_728):void
        {
            var _local_2:* = null;
            var _local_3:* = null;
            _SafeStr_6034 = false;
            if (!_arg_1.getParser().success)
            {
                _SafeStr_4981.clearMixerItems();
                _SafeStr_6035 = false;
                removeInventoryUpdateEvent();
                _SafeStr_4981.setInfoState(1);
            }
            else
            {
                _SafeStr_4981.clearMixerItems();
                _local_2 = _arg_1.getParser().productData;
                _local_3 = _container.sessionDataManager.getFloorItemDataByName(_local_2.furnitureClassName);
                if (!_local_3)
                {
                    return;
                };
                _SafeStr_4981.setInfoState(999, _local_3);
            };
        }

        private function registerForFurniListInvalidate():void
        {
            _SafeStr_6035 = true;
            if (_SafeStr_6033 == null)
            {
                _SafeStr_6033 = new _SafeStr_330(onFurniListInvalidate);
                _container.connection.addMessageEvent(_SafeStr_6033);
            };
        }

        private function onFurniListInvalidate(_arg_1:_SafeStr_330):void
        {
            _container.connection.send(new _SafeStr_265());
            _container.connection.send(new _SafeStr_398(_SafeStr_6031));
            removeInventoryUpdateEvent();
        }

        public function removeInventoryUpdateEvent():void
        {
            if (_SafeStr_6033)
            {
                _container.connection.removeMessageEvent(_SafeStr_6033);
                _SafeStr_6033 = null;
            };
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function get type():String
        {
            return ("RWE_CRAFTING");
        }

        public function set container(_arg_1:IRoomWidgetHandlerContainer):void
        {
            _container = _arg_1;
            addMessageEvents();
            if (((_container.inventory) && (_container.inventory.events)))
            {
                _container.inventory.events.addEventListener("HFLPE_FURNI_LIST_PARSED", onFurniListParsed);
            };
        }

        public function get container():IRoomWidgetHandlerContainer
        {
            return (_container);
        }

        public function set widget(_arg_1:CraftingWidget):void
        {
            _SafeStr_4981 = _arg_1;
        }

        public function getWidgetMessages():Array
        {
            return (null);
        }

        public function processWidgetMessage(_arg_1:RoomWidgetMessage):RoomWidgetUpdateEvent
        {
            return (null);
        }

        public function getProcessedEvents():Array
        {
            return (["RETWE_OPEN_WIDGET", "RETWE_CLOSE_WIDGET"]);
        }

        public function processEvent(_arg_1:Event):void
        {
            if (((_container.roomEngine == null) || (_SafeStr_4981 == null)))
            {
                return;
            };
            var _local_3:RoomEngineToWidgetEvent = (_arg_1 as RoomEngineToWidgetEvent);
            if (_local_3 == null)
            {
                return;
            };
            var _local_2:IRoomObject = _container.roomEngine.getRoomObject(_local_3.roomId, _local_3.objectId, _local_3.category);
            switch (_arg_1.type)
            {
                case "RETWE_OPEN_WIDGET":
                    if (_SafeStr_4981.window != null)
                    {
                        return;
                    };
                    if (_local_2 != null)
                    {
                        _SafeStr_6031 = _local_2.getId();
                        initializeData();
                    };
                    return;
                case "RETWE_CLOSE_WIDGET":
                    _SafeStr_6031 = -1;
                    _SafeStr_4981.hide();
                    return;
            };
        }

        public function get isOwner():Boolean
        {
            var _local_1:int = _container.roomEngine.activeRoomId;
            var _local_2:IRoomObject = _container.roomEngine.getRoomObject(_local_1, _SafeStr_6031, 10);
            return ((!(_local_2 == null)) && (_container.isOwnerOfFurniture(_local_2)));
        }

        public function get craftingInProgress():Boolean
        {
            return (_SafeStr_6034);
        }

        public function set craftingInProgress(_arg_1:Boolean):void
        {
            _SafeStr_6034 = _arg_1;
        }

        public function get inventoryDirty():Boolean
        {
            return (_SafeStr_6035);
        }

        public function update():void
        {
        }


    }
}//package com.sulake.habbo.ui.handler

// _SafeStr_1544 = "_-F19" (String#27933, DoABC#4)
// _SafeStr_265 = "_-j1U" (String#17307, DoABC#4)
// _SafeStr_3130 = "_-fG" (String#751, DoABC#4)
// _SafeStr_3182 = "_-Ib" (String#2336, DoABC#4)
// _SafeStr_326 = "_-z1i" (String#29754, DoABC#4)
// _SafeStr_330 = "_-HH" (String#14644, DoABC#4)
// _SafeStr_398 = "_-T1R" (String#21874, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_5437 = "_-w11" (String#3640, DoABC#4)
// _SafeStr_6030 = "_-bU" (String#11165, DoABC#4)
// _SafeStr_6031 = "_-zH" (String#6589, DoABC#4)
// _SafeStr_6032 = "_-yq" (String#11353, DoABC#4)
// _SafeStr_6033 = "_-W1t" (String#8131, DoABC#4)
// _SafeStr_6034 = "_-o1a" (String#12597, DoABC#4)
// _SafeStr_6035 = "_-yB" (String#9521, DoABC#4)
// _SafeStr_651 = "_-n1z" (String#24272, DoABC#4)
// _SafeStr_702 = "_-1E" (String#24234, DoABC#4)
// _SafeStr_728 = "_-U1y" (String#26852, DoABC#4)
// _SafeStr_835 = "_-sH" (String#28618, DoABC#4)
// _SafeStr_836 = "_-KN" (String#29904, DoABC#4)
// _SafeStr_911 = "_-ky" (String#28370, DoABC#4)
// _SafeStr_956 = "_-j3" (String#24220, DoABC#4)


