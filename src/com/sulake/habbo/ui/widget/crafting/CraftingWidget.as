// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.crafting.CraftingWidget

package com.sulake.habbo.ui.widget.crafting
{
    import com.sulake.habbo.ui.widget.RoomWidgetBase;
    import com.sulake.habbo.ui.RoomUI;
    import com.sulake.habbo.ui.widget.crafting.utils.CraftingFurnitureItem;
    import com.sulake.habbo.window.utils.IModalDialog;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.ui.widget.crafting.controller.CraftingInventoryListController;
    import com.sulake.habbo.ui.widget.crafting.controller.CraftingRecipeListController;
    import com.sulake.habbo.ui.widget.crafting.controller.CraftingMixerController;
    import com.sulake.habbo.ui.widget.crafting.controller.CraftingInfoController;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.components.IItemGridWindow;
    import __AS3__.vec.Vector;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components.ITextWindow;
    import _-a1d._SafeStr_1544;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.session.ISessionDataManager;
    import _-a1d._SafeStr_1534;
    import com.sulake.habbo.ui.handler.CraftingWidgetHandler;

    public class CraftingWidget extends RoomWidgetBase 
    {

        public static const MODE_NONE:int = 0;
        public static const MODE_SECRET_RECIPE:int = 1;
        public static const MODE_PUBLIC_RECIPE:int = 2;

        private var _roomUI:RoomUI;
        private var _SafeStr_5303:CraftingFurnitureItem;
        private var _SafeStr_5302:IModalDialog;
        private var _SafeStr_4858:_SafeStr_3133;
        private var _SafeStr_5298:CraftingInventoryListController;
        private var _SafeStr_5299:CraftingRecipeListController;
        private var _SafeStr_5300:CraftingMixerController;
        private var _SafeStr_5301:CraftingInfoController;
        private var _SafeStr_5304:int = 0;

        public function CraftingWidget(_arg_1:IRoomWidgetHandler, _arg_2:_SafeStr_1695, _arg_3:RoomUI)
        {
            super(_arg_1, _arg_2, assets, localizations);
            _roomUI = _arg_3;
            _SafeStr_5298 = new CraftingInventoryListController(this);
            _SafeStr_5299 = new CraftingRecipeListController(this);
            _SafeStr_5300 = new CraftingMixerController(this);
            _SafeStr_5301 = new CraftingInfoController(this);
            _assets = _arg_3.assets;
            this.handler.widget = this;
        }

        override public function dispose():void
        {
            if (disposed)
            {
                return;
            };
            hide();
            _roomUI = null;
            if (_SafeStr_5298)
            {
                _SafeStr_5298.dispose();
                _SafeStr_5298 = null;
            };
            if (_SafeStr_5299)
            {
                _SafeStr_5299.dispose();
                _SafeStr_5299 = null;
            };
            if (_SafeStr_5300)
            {
                _SafeStr_5300.dispose();
                _SafeStr_5300 = null;
            };
            if (_SafeStr_5301)
            {
                _SafeStr_5301.dispose();
                _SafeStr_5301 = null;
            };
            if (_SafeStr_4858)
            {
                _SafeStr_4858.dispose();
                _SafeStr_4858 = null;
            };
            super.dispose();
        }

        public function hide():void
        {
            handler.removeInventoryUpdateEvent();
            _SafeStr_5300.clearItems();
            _SafeStr_5298.clearItems();
            _SafeStr_5299.clearItems();
            if (craftingInProgress)
            {
                _SafeStr_5301.cancelCrafting();
            };
            _SafeStr_5304 = 0;
            if (_SafeStr_5302 != null)
            {
                _SafeStr_5302.dispose();
                _SafeStr_5302 = null;
            };
        }

        private function createMainWindow():void
        {
            if (window != null)
            {
                return;
            };
            _SafeStr_5302 = windowManager.buildModalDialogFromXML(XML(assets.getAssetByName("craftingwidget_xml").content));
            if (((!(_SafeStr_5302)) || (!(_SafeStr_5302.rootWindow))))
            {
                return;
            };
            var _local_2:_SafeStr_3109 = window.findChildByTag("close");
            if (_local_2 != null)
            {
                _local_2.addEventListener("WME_CLICK", onClose);
            };
            var _local_1:IItemGridWindow = (window.findChildByName("itemgrid_products") as IItemGridWindow);
            _SafeStr_4858 = (_local_1.getGridItemAt(0) as _SafeStr_3133);
            _local_1.removeGridItem(_SafeStr_4858);
            window.procedure = onInput;
            window.center();
        }

        public function populateInventoryItems(_arg_1:Vector.<CraftingFurnitureItem>):void
        {
            _SafeStr_5298.populateInventoryItems(_arg_1);
        }

        public function populateRecipeItems(_arg_1:Vector.<CraftingFurnitureItem>):void
        {
            _SafeStr_5299.populateRecipeItems(_arg_1);
        }

        public function setInfoState(_arg_1:int, ... _args):void
        {
            if (_SafeStr_5301)
            {
                _SafeStr_5301.setState(_arg_1, _args);
            };
        }

        private function onInput(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_DOWN")
            {
                return;
            };
            switch (_arg_2.name)
            {
                case "header_button_close":
                    hide();
                    return;
            };
        }

        private function onClose(_arg_1:WindowMouseEvent):void
        {
            hide();
        }

        public function setInfoText(_arg_1:String):void
        {
            var _local_2:ITextWindow = ((window) ? (window.findChildByName("header_mixer") as ITextWindow) : null);
            if (_local_2)
            {
                _local_2.text = _arg_1;
            };
        }

        public function showWidget():void
        {
            if (window)
            {
                return;
            };
            createMainWindow();
            setInfoText("");
            setInfoState(0);
        }

        public function showCraftingCategories(_arg_1:Vector.<_SafeStr_1544>, _arg_2:Vector.<String>, _arg_3:IRoomEngine, _arg_4:ISessionDataManager):void
        {
            var _local_8:*;
            var _local_6:* = null;
            var _local_9:* = null;
            var _local_10:* = null;
            var _local_5:* = null;
            _local_8 = new Vector.<CraftingFurnitureItem>(0);
            for each (_local_6 in _arg_2)
            {
                _local_9 = _arg_4.getFloorItemDataByName(_local_6);
                if (_local_9)
                {
                    _local_10 = new CraftingFurnitureItem(null, _local_9);
                    _local_5 = handler.container.inventory.getNonRentedInventoryIds("furni", _local_10.typeId);
                    if (((_local_5) && (_local_5.length > 0)))
                    {
                        _local_10.inventoryIds = Vector.<int>(_local_5);
                    };
                    _local_8.push(_local_10);
                };
            };
            populateInventoryItems(_local_8);
            _local_8 = new Vector.<CraftingFurnitureItem>(0);
            for each (var _local_7:_SafeStr_1544 in _arg_1)
            {
                _local_9 = _arg_4.getFloorItemDataByName(_local_7.furnitureClassName);
                if (_local_9)
                {
                    _local_8.push(new CraftingFurnitureItem(_local_7.productCode, _local_9));
                };
            };
            populateRecipeItems(_local_8);
        }

        public function showCraftableProduct(_arg_1:CraftingFurnitureItem):void
        {
            _SafeStr_5303 = _arg_1;
            if (!_SafeStr_5303)
            {
                return;
            };
            setInfoText(((_SafeStr_5303.furnitureData) ? _SafeStr_5303.furnitureData.localizedName : ""));
            handler.getCraftingRecipe(_SafeStr_5303.productCode);
        }

        public function showCraftingRecipe(_arg_1:Vector.<_SafeStr_1534>):void
        {
            showCraftableProductView();
            _SafeStr_5299.showRecipe(_SafeStr_5303, _arg_1);
        }

        public function clearMixerItems():void
        {
            if (_SafeStr_5300)
            {
                _SafeStr_5300.clearItems();
            };
        }

        public function mixerContentChanged(_arg_1:Vector.<int>):void
        {
            if (_arg_1.length > 0)
            {
                setInfoState(1000);
                handler.getCraftingRecipesAvailable(_arg_1);
            }
            else
            {
                setInfoState(1);
            };
        }

        public function showSecretRecipeView():void
        {
            if (_SafeStr_5304 != 1)
            {
                clearMixerItems();
            };
            _SafeStr_5304 = 1;
            setInfoText("");
            setInfoState(1);
        }

        public function showCraftableProductView():void
        {
            if (_SafeStr_5304 != 2)
            {
                clearMixerItems();
            };
            _SafeStr_5304 = 2;
            setInfoState(6);
        }

        public function doCrafting():void
        {
            switch (_SafeStr_5304)
            {
                case 1:
                    handler.doCraftingWithMixer();
                    return;
                case 2:
                    handler.doCraftingWithRecipe();
                default:
            };
        }

        public function getSelectedIngredients():Vector.<int>
        {
            return (_SafeStr_5300.collectSelectedFurnitureIds());
        }

        public function get inSecretRecipeMode():Boolean
        {
            return (_SafeStr_5304 == 1);
        }

        public function get craftingInProgress():Boolean
        {
            return (handler.craftingInProgress);
        }

        public function get inventoryDirty():Boolean
        {
            return (handler.inventoryDirty);
        }

        public function get itemTemplate():_SafeStr_3133
        {
            return (_SafeStr_4858);
        }

        public function get handler():CraftingWidgetHandler
        {
            return (_SafeStr_3914 as CraftingWidgetHandler);
        }

        public function get sessionDataManager():ISessionDataManager
        {
            return (handler.container.sessionDataManager);
        }

        public function get inventoryCtrl():CraftingInventoryListController
        {
            return (_SafeStr_5298);
        }

        public function get recipeCtrl():CraftingRecipeListController
        {
            return (_SafeStr_5299);
        }

        public function get mixerCtrl():CraftingMixerController
        {
            return (_SafeStr_5300);
        }

        public function get infoCtrl():CraftingInfoController
        {
            return (_SafeStr_5301);
        }

        public function get window():_SafeStr_3133
        {
            return ((_SafeStr_5302) ? (_SafeStr_5302.rootWindow as _SafeStr_3133) : null);
        }


    }
}//package com.sulake.habbo.ui.widget.crafting

// _SafeStr_1534 = "_-k1q" (String#24181, DoABC#4)
// _SafeStr_1544 = "_-F19" (String#27933, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3130 = "_-fG" (String#751, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3914 = "_-w1m" (String#1204, DoABC#4)
// _SafeStr_4858 = "_-Pt" (String#4311, DoABC#4)
// _SafeStr_5298 = "_-q10" (String#7237, DoABC#4)
// _SafeStr_5299 = "_-wH" (String#6935, DoABC#4)
// _SafeStr_5300 = "_-xp" (String#6306, DoABC#4)
// _SafeStr_5301 = "_-ZX" (String#6953, DoABC#4)
// _SafeStr_5302 = "_-H8" (String#1949, DoABC#4)
// _SafeStr_5303 = "_-LD" (String#9158, DoABC#4)
// _SafeStr_5304 = "_-Lq" (String#6936, DoABC#4)


