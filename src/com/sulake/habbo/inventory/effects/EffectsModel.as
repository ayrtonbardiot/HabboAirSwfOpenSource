// by nota

//com.sulake.habbo.inventory.effects.EffectsModel

package com.sulake.habbo.inventory.effects
{
    import com.sulake.habbo.inventory.IInventoryModel;
    import com.sulake.habbo.inventory.HabboInventory;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.display.BitmapData;
    import _-d1R._SafeStr_202;
    import _-d1R._SafeStr_944;
    import com.sulake.habbo.inventory._SafeStr_3123;
    import com.sulake.core.window._SafeStr_3133;

    public class EffectsModel implements IInventoryModel 
    {

        public static const FILTER_NONE:int = -1;
        public static const FILTER_INCLUDE_INACTIVE:int = 0;
        public static const FILTER_INCLUDE_ACTIVE:int = 1;

        private var _SafeStr_4360:HabboInventory;
        private var _SafeStr_3882:EffectsView;
        private var _SafeStr_5396:Array;
        private var _assets:IAssetLibrary;
        private var _communication:IHabboCommunicationManager;
        private var _SafeStr_5394:EffectListProxy;
        private var _SafeStr_5395:EffectListProxy;
        private var _disposed:Boolean = false;
        private var _SafeStr_5393:int = -1;

        public function EffectsModel(_arg_1:HabboInventory, _arg_2:_SafeStr_1695, _arg_3:IHabboCommunicationManager, _arg_4:IAssetLibrary, _arg_5:_SafeStr_18)
        {
            _SafeStr_4360 = _arg_1;
            _SafeStr_5396 = [];
            _assets = _arg_4;
            _communication = _arg_3;
            _SafeStr_5394 = new EffectListProxy(this, 1);
            _SafeStr_5395 = new EffectListProxy(this, 0);
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function get lastActivatedEffect():int
        {
            return (_SafeStr_5393);
        }

        public function dispose():void
        {
            if (!_disposed)
            {
                _SafeStr_4360 = null;
                if (_SafeStr_3882 != null)
                {
                    _SafeStr_3882.dispose();
                };
                if (_SafeStr_5394 != null)
                {
                    _SafeStr_5394.dispose();
                    _SafeStr_5394 = null;
                };
                if (_SafeStr_5395 != null)
                {
                    _SafeStr_5395.dispose();
                    _SafeStr_5395 = null;
                };
                _disposed = true;
            };
        }

        public function requestInitialization():void
        {
        }

        public function categorySwitch(_arg_1:String):void
        {
        }

        public function addEffect(_arg_1:Effect, _arg_2:Boolean=true):void
        {
            var _local_4:* = null;
            var _local_3:Effect = getEffect(_arg_1.type);
            if (_local_3 != null)
            {
                _local_3.amountInInventory++;
            }
            else
            {
                _local_4 = BitmapDataAsset(_assets.getAssetByName((("fx_icon_" + _arg_1.type) + "_png")));
                if (_local_4 != null)
                {
                    _arg_1.iconImage = BitmapData(_local_4.content);
                };
                _SafeStr_5396.push(_arg_1);
            };
            if (_arg_2)
            {
                refreshViews();
            };
        }

        private function getEffect(_arg_1:int):Effect
        {
            var _local_3:int;
            var _local_2:* = null;
            _local_3 = 0;
            while (_local_3 < _SafeStr_5396.length)
            {
                _local_2 = _SafeStr_5396[_local_3];
                if (_local_2.type == _arg_1)
                {
                    return (_local_2);
                };
                _local_3++;
            };
            return (null);
        }

        private function removeEffect(_arg_1:int):void
        {
            var _local_3:int;
            var _local_2:* = null;
            _local_3 = 0;
            while (_local_3 < _SafeStr_5396.length)
            {
                _local_2 = _SafeStr_5396[_local_3];
                if (_local_2.type == _arg_1)
                {
                    _SafeStr_5396.splice(_local_3, 1);
                    refreshViews();
                    return;
                };
                _local_3++;
            };
        }

        public function refreshViews():void
        {
            if (_SafeStr_3882)
            {
                _SafeStr_3882.updateListViews();
                _SafeStr_3882.updateActionView();
            };
        }

        public function requestEffectActivated(_arg_1:int):void
        {
            _SafeStr_4360.communication.connection.send(new _SafeStr_202(_arg_1));
        }

        public function setEffectActivated(_arg_1:int):void
        {
            var _local_2:Effect = getEffect(_arg_1);
            if (_local_2 != null)
            {
                stopUsingAllEffects(false, false);
                _local_2.isActive = true;
                _local_2.isInUse = true;
                refreshViews();
            };
        }

        public function useEffect(_arg_1:int):void
        {
            stopUsingAllEffects(false, false, true);
            var _local_2:Effect = getEffect(_arg_1);
            if (_local_2 == null)
            {
                return;
            };
            if (!_local_2.isActive)
            {
                requestEffectActivated(_local_2.type);
            };
            if (_local_2.isInUse == false)
            {
                _local_2.isInUse = true;
                _SafeStr_4360.communication.connection.send(new _SafeStr_944(_arg_1));
                _SafeStr_5393 = _arg_1;
                refreshViews();
            };
        }

        public function stopUsingEffect(_arg_1:int, _arg_2:Boolean=false):void
        {
            var _local_3:Effect = getEffect(_arg_1);
            if (_local_3 != null)
            {
                if (_local_3.isInUse == true)
                {
                    _local_3.isInUse = false;
                    if (_arg_2)
                    {
                        _SafeStr_4360.communication.connection.send(new _SafeStr_944(-1));
                        _SafeStr_5393 = -1;
                    };
                    refreshViews();
                };
            };
        }

        public function stopUsingAllEffects(_arg_1:Boolean=true, _arg_2:Boolean=true, _arg_3:Boolean=false):void
        {
            var _local_5:int;
            var _local_4:* = null;
            _local_5 = 0;
            while (_local_5 < _SafeStr_5396.length)
            {
                _local_4 = _SafeStr_5396[_local_5];
                _local_4.isInUse = false;
                _local_5++;
            };
            if (_arg_1)
            {
                _SafeStr_4360.communication.connection.send(new _SafeStr_944(-1));
            };
            if (_arg_2)
            {
                refreshViews();
            };
            if (_arg_3)
            {
                _SafeStr_5393 = -1;
            };
        }

        public function toggleEffectSelected(_arg_1:int):void
        {
            var _local_2:Effect = getEffect(_arg_1);
            if (_local_2 != null)
            {
                if (_local_2.isSelected)
                {
                    setEffectDeselected(_arg_1);
                }
                else
                {
                    setEffectSelected(_arg_1);
                };
                refreshViews();
            };
        }

        public function getEffectInterface(_arg_1:int):_SafeStr_3123
        {
            return (getEffect(_arg_1) as _SafeStr_3123);
        }

        public function setEffectSelected(_arg_1:int):void
        {
            var _local_2:Effect = getEffect(_arg_1);
            if (_local_2 != null)
            {
                setAllEffectsDeselected(false);
                _local_2.isSelected = true;
                refreshViews();
            };
        }

        public function setEffectDeselected(_arg_1:int):void
        {
            var _local_2:Effect = getEffect(_arg_1);
            if (_local_2 != null)
            {
                _local_2.isSelected = false;
                refreshViews();
            };
        }

        private function setAllEffectsDeselected(_arg_1:Boolean=true):void
        {
            var _local_3:int;
            var _local_2:* = null;
            _local_3 = 0;
            while (_local_3 < _SafeStr_5396.length)
            {
                _local_2 = _SafeStr_5396[_local_3];
                _local_2.isSelected = false;
                _local_3++;
            };
            if (_arg_1)
            {
                refreshViews();
            };
        }

        public function getSelectedEffect(_arg_1:int=-1):Effect
        {
            var _local_4:int;
            var _local_3:* = null;
            var _local_2:Array = getEffects(_arg_1);
            _local_4 = 0;
            while (_local_4 < _local_2.length)
            {
                _local_3 = _local_2[_local_4];
                if (_local_3.isSelected)
                {
                    return (_local_3);
                };
                _local_4++;
            };
            return (null);
        }

        public function getEffects(_arg_1:int=-1):Array
        {
            var _local_4:int;
            var _local_3:* = null;
            var _local_2:Array = [];
            _local_4 = 0;
            while (_local_4 < _SafeStr_5396.length)
            {
                _local_3 = _SafeStr_5396[_local_4];
                if (((((_local_3.isActive) && (_arg_1 == 1)) || ((!(_local_3.isActive)) && (_arg_1 == 0))) || (_arg_1 == -1)))
                {
                    _local_2.push(_local_3);
                };
                _local_4++;
            };
            return (_local_2);
        }

        public function setEffectExpired(_arg_1:int):void
        {
            _SafeStr_5393 = -1;
            var _local_2:Effect = getEffect(_arg_1);
            if (_local_2 != null)
            {
                if (_local_2.amountInInventory > 1)
                {
                    _local_2.setOneEffectExpired();
                    refreshViews();
                }
                else
                {
                    removeEffect(_local_2.type);
                };
            };
        }

        public function getItemInIndex(_arg_1:int, _arg_2:int=-1):Effect
        {
            var _local_3:Array = getEffects(_arg_2);
            if (((_arg_1 < 0) || (_arg_1 >= _local_3.length)))
            {
                return (null);
            };
            var _local_4:Effect = _local_3[_arg_1];
            return (_local_4);
        }

        public function getWindowContainer():_SafeStr_3133
        {
            return ((_SafeStr_3882) ? _SafeStr_3882.getWindowContainer() : null);
        }

        public function closingInventoryView():void
        {
        }

        public function subCategorySwitch(_arg_1:String):void
        {
        }

        public function reactivateLastEffect():void
        {
            if (_SafeStr_5393 != -1)
            {
                useEffect(_SafeStr_5393);
            };
        }

        public function updateView():void
        {
            if (((_SafeStr_3882) && (!(_SafeStr_3882.disposed))))
            {
                _SafeStr_3882.updateListViews();
                _SafeStr_3882.updateActionView();
            };
        }

        public function selectItemById(_arg_1:String):void
        {
            setEffectSelected(int(_arg_1));
        }


    }
}//package com.sulake.habbo.inventory.effects

// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_202 = "_-S1Z" (String#29158, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_25 = "_-G19" (String#757, DoABC#4)
// _SafeStr_3123 = "_-k1o" (String#7780, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3882 = "_-D10" (String#53, DoABC#4)
// _SafeStr_4360 = "_-58" (String#91, DoABC#4)
// _SafeStr_5393 = "_-I1k" (String#6201, DoABC#4)
// _SafeStr_5394 = "_-e0" (String#10535, DoABC#4)
// _SafeStr_5395 = "_-C1H" (String#11311, DoABC#4)
// _SafeStr_5396 = "_-gj" (String#3064, DoABC#4)
// _SafeStr_944 = "_-6y" (String#12807, DoABC#4)


