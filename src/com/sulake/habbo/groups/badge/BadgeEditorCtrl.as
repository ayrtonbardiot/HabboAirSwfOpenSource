// by nota

//com.sulake.habbo.groups.badge.BadgeEditorCtrl

package com.sulake.habbo.groups.badge
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.groups.HabboGroupsManager;
    import com.sulake.core.window._SafeStr_3133;
    import __AS3__.vec.Vector;
    import com.sulake.core.window.components.IItemGridWindow;
    import com.sulake.core.window.components._SafeStr_3264;
    import com.sulake.habbo.groups.events.HabboGroupsEditorData;
    import _-W1K._SafeStr_1550;
    import flash.display.BitmapData;
    import flash.geom.Point;
    import com.sulake.habbo.groups.*;

    public class BadgeEditorCtrl implements _SafeStr_13 
    {

        private var _SafeStr_4144:HabboGroupsManager;
        private var _window:_SafeStr_3133;
        private var _SafeStr_5625:_SafeStr_3133;
        private var _SafeStr_5623:Array;
        private var _SafeStr_5622:BadgeSelectPartCtrl;
        private var _disposed:Boolean = false;
        private var _layers:Vector.<BadgeLayerCtrl>;
        private var _SafeStr_5621:BadgeLayerOptions;
        private var _SafeStr_5619:_SafeStr_3133;
        private var _SafeStr_5620:IItemGridWindow;
        private var _SafeStr_5618:_SafeStr_3133;
        private var _SafeStr_5624:Vector.<_SafeStr_3264>;

        public function BadgeEditorCtrl(_arg_1:HabboGroupsManager)
        {
            _SafeStr_4144 = _arg_1;
            _SafeStr_4144.events.addEventListener("HGE_EDIT_INFO", onHabboGroupsEditorData);
            _SafeStr_5622 = new BadgeSelectPartCtrl(_SafeStr_4144, this);
            _layers = new Vector.<BadgeLayerCtrl>();
            _layers.push(new BadgeLayerCtrl(_SafeStr_4144, this, 0));
            _layers.push(new BadgeLayerCtrl(_SafeStr_4144, this, 1));
            _layers.push(new BadgeLayerCtrl(_SafeStr_4144, this, 2));
            _layers.push(new BadgeLayerCtrl(_SafeStr_4144, this, 3));
            _layers.push(new BadgeLayerCtrl(_SafeStr_4144, this, 4));
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function get partEditContainer():_SafeStr_3133
        {
            return (_SafeStr_5618);
        }

        public function get partSelectContainer():_SafeStr_3133
        {
            return (_SafeStr_5619);
        }

        public function get partSelectGrid():IItemGridWindow
        {
            return (_SafeStr_5620);
        }

        public function get currentLayerOptions():BadgeLayerOptions
        {
            return (_SafeStr_5621);
        }

        public function get badgeSelectPartCtrl():BadgeSelectPartCtrl
        {
            return (_SafeStr_5622);
        }

        public function get isIntialized():Boolean
        {
            return ((!(_window == null)) && (!(_SafeStr_5623 == null)));
        }

        public function dispose():void
        {
            if (!_disposed)
            {
                if (_layers)
                {
                    for each (var _local_1:BadgeLayerCtrl in _layers)
                    {
                        _local_1.dispose();
                    };
                    _layers = null;
                };
                if (_SafeStr_5622)
                {
                    _SafeStr_5622.dispose();
                    _SafeStr_5622 = null;
                };
                if (_SafeStr_5619)
                {
                    _SafeStr_5619.dispose();
                    _SafeStr_5619 = null;
                };
                if (_SafeStr_5620)
                {
                    _SafeStr_5620.dispose();
                    _SafeStr_5620 = null;
                };
                if (_SafeStr_5618)
                {
                    _SafeStr_5618.dispose();
                    _SafeStr_5618 = null;
                };
                if (_SafeStr_5624)
                {
                    for each (var _local_2:_SafeStr_3264 in _SafeStr_5624)
                    {
                        _local_2.dispose();
                    };
                    _SafeStr_5624 = null;
                };
                if (_window)
                {
                    _window.dispose();
                    _window = null;
                };
                _SafeStr_5623 = null;
                _SafeStr_5621 = null;
                _window = null;
                _SafeStr_4144 = null;
                _disposed = true;
            };
        }

        public function onHabboGroupsEditorData(_arg_1:HabboGroupsEditorData):void
        {
            _SafeStr_5622.loadData();
            createWindow(null, null);
        }

        public function createWindow(_arg_1:_SafeStr_3133, _arg_2:Array):void
        {
            var _local_3:int;
            if (((!(_window == null)) || (_disposed)))
            {
                return;
            };
            if (_arg_1 != null)
            {
                _SafeStr_5625 = _arg_1;
            };
            if (_arg_2 != null)
            {
                _SafeStr_5623 = _arg_2;
            };
            if (((((_SafeStr_5625 == null) || (_SafeStr_5623 == null)) || (_SafeStr_4144 == null)) || (_SafeStr_4144.guildEditorData == null)))
            {
                return;
            };
            _window = (_SafeStr_4144.getXmlWindow("badge_editor") as _SafeStr_3133);
            var _local_4:_SafeStr_3133 = (_window.findChildByName("guild_badge") as _SafeStr_3133);
            _SafeStr_5624 = new Vector.<_SafeStr_3264>();
            _SafeStr_5624.push((_local_4.findChildByName("layer_0") as _SafeStr_3264));
            _SafeStr_5624.push((_local_4.findChildByName("layer_1") as _SafeStr_3264));
            _SafeStr_5624.push((_local_4.findChildByName("layer_2") as _SafeStr_3264));
            _SafeStr_5624.push((_local_4.findChildByName("layer_3") as _SafeStr_3264));
            _SafeStr_5624.push((_local_4.findChildByName("layer_4") as _SafeStr_3264));
            _SafeStr_5618 = (_window.findChildByName("part_edit") as _SafeStr_3133);
            _SafeStr_5619 = (_window.findChildByName("part_select") as _SafeStr_3133);
            _SafeStr_5619.visible = false;
            _SafeStr_5620 = (_SafeStr_5619.findChildByName("part_select_grid") as IItemGridWindow);
            _local_3 = 0;
            while (_local_3 < _layers.length)
            {
                _layers[_local_3].createWindow();
                _local_3++;
            };
            resetLayerOptions(_SafeStr_5623);
            _SafeStr_5625.addChild(_window);
        }

        public function resetLayerOptions(_arg_1:Array):void
        {
            var _local_2:int;
            if (!this.isIntialized)
            {
                return;
            };
            if (_SafeStr_5619.visible)
            {
                _SafeStr_5619.visible = false;
                _SafeStr_5618.visible = true;
            };
            _SafeStr_5623 = _arg_1;
            _SafeStr_5621 = null;
            _SafeStr_5618.visible = true;
            _SafeStr_5619.visible = false;
            _SafeStr_5622.loadData();
            _local_2 = 0;
            while (_local_2 < _layers.length)
            {
                _layers[_local_2].setLayerOptions(createLayerOption(_local_2));
                _layers[_local_2].updateSelectedPart();
                _local_2++;
            };
        }

        private function createLayerOption(_arg_1:int):BadgeLayerOptions
        {
            var _local_3:int;
            var _local_2:_SafeStr_1550 = (_SafeStr_5623[_arg_1] as _SafeStr_1550);
            var _local_4:BadgeLayerOptions = new BadgeLayerOptions();
            _local_4.layerIndex = _arg_1;
            _local_4.colorIndex = 0;
            _local_4.setGrid(_local_2.position);
            _local_3 = 0;
            while (_local_3 < _SafeStr_4144.guildEditorData.badgeColors.length)
            {
                if (_SafeStr_4144.guildEditorData.badgeColors[_local_3].id == _local_2.colorId)
                {
                    _local_4.colorIndex = _local_3;
                    break;
                };
                _local_3++;
            };
            if (_arg_1 == BadgeLayerCtrl.BASE_LAYER_INDEX)
            {
                _local_3 = 0;
                while (_local_3 < _SafeStr_4144.guildEditorData.baseParts.length)
                {
                    if (_SafeStr_4144.guildEditorData.baseParts[_local_3].id == _local_2.partId)
                    {
                        _local_4.partIndex = _local_3;
                        break;
                    };
                    _local_3++;
                };
            }
            else
            {
                _local_3 = 0;
                while (_local_3 < _SafeStr_4144.guildEditorData.layerParts.length)
                {
                    if (_SafeStr_4144.guildEditorData.layerParts[_local_3].id == _local_2.partId)
                    {
                        _local_4.partIndex = _local_3;
                        break;
                    };
                    _local_3++;
                };
            };
            return (_local_4);
        }

        public function onPartSelected(_arg_1:BadgeSelectPartCtrl):void
        {
            _SafeStr_5621.partIndex = _arg_1.getSelectedPartIndex();
            _layers[_SafeStr_5621.layerIndex].setLayerOptions(currentLayerOptions);
            _SafeStr_5618.visible = true;
            _SafeStr_5619.visible = false;
        }

        public function onPartHover(_arg_1:BadgeSelectPartCtrl):void
        {
            updatePreviewImage(_arg_1.layerOptions);
        }

        public function onPartChanged(_arg_1:BadgeLayerCtrl):void
        {
            updatePreviewImage(_arg_1.layerOptions);
        }

        public function updatePreviewImage(_arg_1:BadgeLayerOptions):void
        {
            var _local_2:BitmapData = _SafeStr_5622.getPartItemImage(_arg_1);
            if (_local_2 != null)
            {
                _SafeStr_5624[_arg_1.layerIndex].bitmap = _local_2.clone();
                _SafeStr_5624[_arg_1.layerIndex].visible = true;
            }
            else
            {
                _SafeStr_5624[_arg_1.layerIndex].visible = false;
            };
        }

        public function onShowSelectPart(_arg_1:BadgeLayerCtrl):void
        {
            var _local_2:BadgeLayerOptions = _SafeStr_5621;
            _SafeStr_5621 = _arg_1.layerOptions.clone();
            if (!_arg_1.layerOptions.equalVisuals(_local_2))
            {
                _SafeStr_5622.updateGrid();
            }
            else
            {
                _SafeStr_5622.layerOptions = _SafeStr_5621.clone();
            };
            _SafeStr_5618.visible = false;
            _SafeStr_5619.visible = true;
        }

        public function onViewChange():void
        {
            if (((isIntialized) && (_SafeStr_5619.visible)))
            {
                updatePreviewImage(_SafeStr_5621);
                _SafeStr_5618.visible = true;
                _SafeStr_5619.visible = false;
            };
        }

        public function getBadgeSettings():Array
        {
            var _local_2:int;
            var _local_3:int;
            var _local_1:Array = [];
            for each (var _local_4:BadgeLayerCtrl in _layers)
            {
                _local_2 = getLayerPartId(_local_4.layerOptions);
                if (_local_2 >= 0)
                {
                    _local_3 = getLayerColorId(_local_4.layerOptions);
                    if (_local_3 >= 0)
                    {
                        _local_1.push(_local_2);
                        _local_1.push(_local_3);
                        _local_1.push(_local_4.layerOptions.position);
                    };
                };
            };
            return (_local_1);
        }

        public function get primaryColorIndex():int
        {
            if (_layers == null)
            {
                return (0);
            };
            var _local_1:int;
            for each (var _local_2:BadgeLayerCtrl in _layers)
            {
                if (!((getLayerPartId(_local_2.layerOptions) < 0) || (getLayerColorId(_local_2.layerOptions) < 0)))
                {
                    _local_1 = _local_2.layerOptions.colorIndex;
                };
            };
            return (_local_1);
        }

        public function get secondaryColorIndex():int
        {
            if (_layers != null)
            {
                return (_layers[0].layerOptions.colorIndex);
            };
            return (0);
        }

        public function getBadgeBitmap():BitmapData
        {
            var _local_1:BitmapData = new BitmapData(BadgeEditorPartItem.IMAGE_WIDTH, BadgeEditorPartItem.IMAGE_HEIGHT, true, 15329761);
            for each (var _local_2:_SafeStr_3264 in _SafeStr_5624)
            {
                if (_local_2.visible)
                {
                    _local_1.copyPixels(_local_2.bitmap, _local_1.rect, new Point(), null, null, true);
                };
            };
            return (_local_1);
        }

        private function getLayerPartId(_arg_1:BadgeLayerOptions):int
        {
            if (_arg_1.partIndex < 0)
            {
                return (-1);
            };
            if (_arg_1.layerIndex == BadgeLayerCtrl.BASE_LAYER_INDEX)
            {
                if (_arg_1.partIndex >= _SafeStr_4144.guildEditorData.baseParts.length)
                {
                    return (-1);
                };
                return (_SafeStr_4144.guildEditorData.baseParts[_arg_1.partIndex].id);
            };
            if (_arg_1.partIndex >= _SafeStr_4144.guildEditorData.layerParts.length)
            {
                return (-1);
            };
            return (_SafeStr_4144.guildEditorData.layerParts[_arg_1.partIndex].id);
        }

        private function getLayerColorId(_arg_1:BadgeLayerOptions):int
        {
            if (((_arg_1.colorIndex < 0) || (_arg_1.colorIndex >= _SafeStr_4144.guildEditorData.badgeColors.length)))
            {
                return (-1);
            };
            return (_SafeStr_4144.guildEditorData.badgeColors[_arg_1.colorIndex].id);
        }


    }
}//package com.sulake.habbo.groups.badge

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_1550 = "_-zY" (String#28478, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_4144 = "_-n1T" (String#228, DoABC#4)
// _SafeStr_5618 = "_-fi" (String#5590, DoABC#4)
// _SafeStr_5619 = "_-FX" (String#4535, DoABC#4)
// _SafeStr_5620 = "_-fF" (String#9096, DoABC#4)
// _SafeStr_5621 = "_-PM" (String#5693, DoABC#4)
// _SafeStr_5622 = "_-X1D" (String#5621, DoABC#4)
// _SafeStr_5623 = "_-g5" (String#6698, DoABC#4)
// _SafeStr_5624 = "_-qH" (String#4746, DoABC#4)
// _SafeStr_5625 = "_-sM" (String#6957, DoABC#4)


