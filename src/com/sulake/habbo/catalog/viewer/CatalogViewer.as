// by nota

//com.sulake.habbo.catalog.viewer.CatalogViewer

package com.sulake.habbo.catalog.viewer
{
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.catalog._SafeStr_3141;
    import flash.events.Event;
    import com.sulake.habbo.session.furniture._SafeStr_3130;

    public class CatalogViewer implements _SafeStr_3229 
    {

        private var _catalog:HabboCatalog;
        private var _container:_SafeStr_3133;
        private var _SafeStr_4715:_SafeStr_3211;
        private var _forceRefresh:Boolean;
        private var _SafeStr_5057:int;

        public function CatalogViewer(_arg_1:HabboCatalog, _arg_2:_SafeStr_3133)
        {
            _catalog = _arg_1;
            _container = _arg_2;
        }

        public function get roomEngine():IRoomEngine
        {
            return (_catalog.roomEngine);
        }

        public function dispose():void
        {
            if (_SafeStr_4715)
            {
                _SafeStr_4715.dispose();
                _SafeStr_4715 = null;
            };
            _catalog = null;
            _container = null;
        }

        public function get catalog():IHabboCatalog
        {
            return (_catalog);
        }

        public function showCatalogPage(_arg_1:int, _arg_2:String, _arg_3:IPageLocalization, _arg_4:Vector.<_SafeStr_3141>, _arg_5:int, _arg_6:Boolean):void
        {
            _SafeStr_14.log(("[Catalog Viewer] Show Catalog Page: " + [_arg_1, _arg_2, _arg_4.length, _arg_5]));
            if (_SafeStr_4715 != null)
            {
                if (((!(_forceRefresh)) && (_SafeStr_4715.pageId == _arg_1)))
                {
                    if (_arg_5 > -1)
                    {
                        _SafeStr_4715.selectOffer(_arg_5);
                    };
                    return;
                };
                disposeCurrentPage();
            };
            var _local_7:_SafeStr_3211 = new CatalogPage(this, _arg_1, _arg_2, _arg_3, _arg_4, _catalog, _arg_6);
            _SafeStr_4715 = _local_7;
            _SafeStr_5057 = ((_arg_1 > -12345678) ? _arg_1 : _SafeStr_5057);
            if (_local_7.window != null)
            {
                _container.addChild(_local_7.window);
                _local_7.window.height = _container.height;
                _container.width = _local_7.window.width;
                _container.x = ((_container.parent.width - _container.width) - 8);
                if (_container.x < 130)
                {
                    _catalog.setLeftPaneVisibility(false);
                }
                else
                {
                    _catalog.setLeftPaneVisibility(true);
                };
            }
            else
            {
                _SafeStr_14.log(("[CatalogViewer] No window for page: " + _arg_2));
            };
            _container.visible = true;
            _forceRefresh = false;
            _local_7.selectOffer(_arg_5);
        }

        public function disposeCurrentPage():void
        {
            if (_SafeStr_4715 != null)
            {
                _container.removeChild(_SafeStr_4715.window);
                _SafeStr_4715.dispose();
                _container.invalidate();
            };
        }

        public function catalogWindowClosed():void
        {
            if (_SafeStr_4715 != null)
            {
                _SafeStr_4715.closed();
            };
        }

        public function dispatchWidgetEvent(_arg_1:Event):Boolean
        {
            return (_SafeStr_4715.dispatchWidgetEvent(_arg_1));
        }

        public function getCurrentLayoutCode():String
        {
            if (_SafeStr_4715 == null)
            {
                return ("");
            };
            return (_SafeStr_4715.layoutCode);
        }

        public function get currentPage():_SafeStr_3211
        {
            return (_SafeStr_4715);
        }

        public function showSearchResults(_arg_1:Vector.<_SafeStr_3130>):void
        {
            var _local_3:* = null;
            if (_SafeStr_4715 != null)
            {
                _container.removeChild(_SafeStr_4715.window);
                _SafeStr_4715.dispose();
            };
            var _local_2:Vector.<_SafeStr_3141> = new Vector.<_SafeStr_3141>(0);
            for each (var _local_5:_SafeStr_3130 in _arg_1)
            {
                _local_3 = new FurnitureOffer(_local_5, _catalog);
                _local_2.push(_local_3);
            };
            var _local_4:_SafeStr_3211 = new CatalogPage(this, -1, "default_3x3", new PageLocalization(["catalog_header_roombuilder", "credits_v3_teaser"], ["${catalog.search.results}"]), _local_2, _catalog, false, 1);
            _SafeStr_4715 = _local_4;
            if (_local_4.window != null)
            {
                _container.addChild(_local_4.window);
                _local_4.window.width = _container.width;
                _local_4.window.height = _container.height;
            }
            else
            {
                _SafeStr_14.log("[CatalogViewer] No window for page: <SEARCH>");
            };
            _container.visible = true;
        }

        public function get viewerTags():Array
        {
            return ((_container) ? _container.tags : []);
        }

        public function setForceRefresh():void
        {
            _forceRefresh = true;
        }

        public function get previousPageId():int
        {
            return (_SafeStr_5057);
        }


    }
}//package com.sulake.habbo.catalog.viewer

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_3130 = "_-fG" (String#751, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3141 = "_-MT" (String#715, DoABC#4)
// _SafeStr_3211 = "_-M1N" (String#2666, DoABC#4)
// _SafeStr_3229 = "_-a1p" (String#8259, DoABC#4)
// _SafeStr_4715 = "_-Oe" (String#1538, DoABC#4)
// _SafeStr_5057 = "_-X1r" (String#14256, DoABC#4)


