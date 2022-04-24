// by nota

//com.sulake.habbo.catalog.navigation.CatalogNodeRenderable

package com.sulake.habbo.catalog.navigation
{
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.IItemListWindow;
    import _-AE._SafeStr_1289;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class CatalogNodeRenderable extends CatalogNode 
    {

        private static const ITEM_SELECTION_COLOR:Number = 0xFFFFFFFF;

        private var _window:_SafeStr_3133;
        private var _SafeStr_5498:IItemListWindow;
        private var _isOpen:Boolean = false;
        private var _active:Boolean;
        private var _itemNormalColor:uint;
        private var _itemSelectedEtchingColor:uint;

        public function CatalogNodeRenderable(_arg_1:_SafeStr_3107, _arg_2:_SafeStr_1289, _arg_3:int, _arg_4:_SafeStr_3170)
        {
            super(_arg_1, _arg_2, _arg_3, _arg_4);
        }

        public function get window():_SafeStr_3133
        {
            return (_window);
        }

        override public function get isOpen():Boolean
        {
            return (_isOpen);
        }

        override public function get visible():Boolean
        {
            return (true);
        }

        override public function dispose():void
        {
            if (_isOpen)
            {
                close();
                deactivate();
            };
            _window = null;
            _SafeStr_5498 = null;
            super.dispose();
        }

        public function addToList(_arg_1:IItemListWindow, _arg_2:Boolean=true):void
        {
            if (_window == null)
            {
                createWindow();
                setInactiveLook();
            };
            _arg_1.addListItem(_window);
            if (isBranch)
            {
                if (_SafeStr_5498 == null)
                {
                    createChildList();
                };
                _arg_1.addListItem(_SafeStr_5498);
                refreshChildren();
            };
            _arg_1.arrangeListItems();
        }

        public function removeFromList(_arg_1:IItemListWindow):void
        {
            _arg_1.removeListItem(_window);
            if (isBranch)
            {
                _arg_1.removeListItem(_SafeStr_5498);
            };
        }

        override public function activate():void
        {
            setActiveLook();
            _active = true;
        }

        override public function deactivate():void
        {
            setInactiveLook();
            _active = false;
        }

        override public function open():void
        {
            var _local_1:* = null;
            showChildren();
            _isOpen = true;
            if (((isBranch) && (!(_window == null))))
            {
                _local_1 = _window.findChildByTag("DOWNBTN");
                if (_local_1 != null)
                {
                    _local_1.style = 7;
                };
            };
        }

        override public function close():void
        {
            var _local_1:* = null;
            removeChildren();
            _isOpen = false;
            if (((isBranch) && (!(_window == null))))
            {
                _local_1 = _window.findChildByTag("DOWNBTN");
                if (_local_1 != null)
                {
                    _local_1.style = 5;
                };
            };
        }

        private function refreshChildren():void
        {
            var _local_1:* = null;
            if (_SafeStr_5498 == null)
            {
                return;
            };
            for each (var _local_2:_SafeStr_3170 in children)
            {
                _local_1 = (_local_2 as CatalogNodeRenderable);
                if (_local_1 != null)
                {
                    if (_local_1.visible)
                    {
                        _local_1.addToList(_SafeStr_5498);
                        _local_1.setInactiveLook();
                    }
                    else
                    {
                        _local_1.removeFromList(_SafeStr_5498);
                    };
                };
            };
            _SafeStr_5498.arrangeListItems();
        }

        private function showChildren():void
        {
            var _local_1:int;
            var _local_2:int;
            if (_SafeStr_5498 == null)
            {
                createChildList();
            };
            for each (var _local_3:_SafeStr_3170 in children)
            {
                if (_local_3.visible)
                {
                    (_local_3 as CatalogNodeRenderable).addToList(_SafeStr_5498);
                };
            };
            if (_SafeStr_5498 != null)
            {
                _SafeStr_5498.visible = true;
                _local_1 = 0;
                _local_2 = 0;
                while (_local_2 < _SafeStr_5498.numListItems)
                {
                    if (_SafeStr_5498.getListItemAt(_local_2).visible)
                    {
                        _local_1++;
                    };
                    _local_2++;
                };
                _SafeStr_5498.height = (_local_1 * 21);
            };
        }

        private function removeChildren():void
        {
            for each (var _local_1:_SafeStr_3170 in children)
            {
                if (_local_1.visible)
                {
                    (_local_1 as CatalogNodeRenderable).removeFromList(_SafeStr_5498);
                };
            };
            if (_SafeStr_5498 != null)
            {
                _SafeStr_5498.height = 0;
                _SafeStr_5498.visible = false;
                _SafeStr_5498.x = 0;
            };
        }

        private function createChildList():void
        {
            _SafeStr_5498 = (navigator.listTemplate.clone() as IItemListWindow);
            removeChildren();
        }

        private function createWindow():void
        {
            _window = (navigator.getItemTemplate(depth).clone() as _SafeStr_3133);
            var _local_2:ITextWindow = (_window.findChildByTag("ITEM_TITLE") as ITextWindow);
            var _local_1:_SafeStr_3109 = _window.findChildByTag("DOWNBTN");
            if (_local_2 != null)
            {
                _local_2.caption = localization;
                _itemNormalColor = _local_2.textColor;
                _itemSelectedEtchingColor = _local_2.etchingColor;
            };
            var _local_3:_SafeStr_3109 = _window.findChildByTag("SELECTION_HILIGHT");
            if (_local_3)
            {
                _local_3.visible = false;
            };
            if (_local_1 != null)
            {
                _local_1.visible = (!(isLeaf));
            };
            IStaticBitmapWrapperWindow(_window.findChildByName("icon")).assetUri = ((navigator.catalog.imageGalleryHost + iconName) + ".png");
            if (navigator.isDeepHierarchy)
            {
                if (depth == 1)
                {
                    _window.findChildByName("icon").visible = false;
                    _window.findChildByTag("ITEM_TITLE").x = 0;
                };
                if (depth > 3)
                {
                    _window.findChildByName("icon").visible = isBranch;
                    _window.findChildByTag("ITEM_TITLE").x = (42 + (5 * (depth - 3)));
                };
            };
            _window.addEventListener("WME_CLICK", onButtonClicked);
            _window.addEventListener("WME_OVER", onOver);
            _window.addEventListener("WME_OUT", onOut);
            if (_local_1 != null)
            {
                _local_1.addEventListener("WME_CLICK", onButtonClicked);
            };
        }

        private function onOut(_arg_1:WindowMouseEvent):void
        {
            if (!_active)
            {
                setInactiveLook();
            };
        }

        private function onOver(_arg_1:WindowMouseEvent):void
        {
            if (!_active)
            {
                setActiveLook();
            };
        }

        private function setInactiveLook():void
        {
            var _local_1:* = null;
            var _local_2:* = null;
            if (_window != null)
            {
                _local_1 = (_window.findChildByTag("SELECTION_COLOR") as ITextWindow);
                if (_local_1 != null)
                {
                    _local_1.textColor = _itemNormalColor;
                    _local_1.etchingColor = 0;
                };
                _local_2 = _window.findChildByTag("SELECTION_HILIGHT");
                if (_local_2 != null)
                {
                    _local_2.visible = false;
                };
            };
        }

        private function setActiveLook():void
        {
            var _local_1:* = null;
            var _local_2:* = null;
            if (_window != null)
            {
                _local_1 = (_window.findChildByTag("SELECTION_COLOR") as ITextWindow);
                if (_local_1 != null)
                {
                    _local_1.textColor = 0xFFFFFFFF;
                    _local_1.etchingColor = _itemSelectedEtchingColor;
                };
                _local_2 = (_window.findChildByTag("SELECTION_HILIGHT") as _SafeStr_3133);
                if (_local_2 != null)
                {
                    _local_2.visible = true;
                };
            };
        }

        private function onButtonClicked(_arg_1:WindowMouseEvent):void
        {
            navigator.activateNode(this);
        }

        public function updateChildListHeight():void
        {
            var _local_2:int;
            if (_SafeStr_5498 == null)
            {
                return;
            };
            _SafeStr_5498.height = 0;
            if (_SafeStr_5498 != null)
            {
                _local_2 = 0;
                while (_local_2 < _SafeStr_5498.numListItems)
                {
                    if (_SafeStr_5498.getListItemAt(_local_2).visible)
                    {
                        _SafeStr_5498.height = (_SafeStr_5498.height + _SafeStr_5498.getListItemAt(_local_2).height);
                    };
                    _local_2++;
                };
            };
            var _local_1:CatalogNodeRenderable = (parent as CatalogNodeRenderable);
            if (_local_1)
            {
                _local_1.updateChildListHeight();
            };
        }

        override public function get offsetV():int
        {
            return (_window.y + 21);
        }


    }
}//package com.sulake.habbo.catalog.navigation

// _SafeStr_1289 = "_-H1D" (String#13342, DoABC#4)
// _SafeStr_3107 = "_-Bx" (String#5257, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3170 = "_-51P" (String#969, DoABC#4)
// _SafeStr_5498 = "_-GX" (String#2633, DoABC#4)


