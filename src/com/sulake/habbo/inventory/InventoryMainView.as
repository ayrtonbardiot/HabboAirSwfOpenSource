// by nota

//com.sulake.habbo.inventory.InventoryMainView

package com.sulake.habbo.inventory
{
    import flash.geom.Point;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.toolbar.IHabboToolbar;
    import flash.utils.Dictionary;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.components.ITabContextWindow;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.habbo.utils.WindowToggle;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window.components.ILabelWindow;
    import com.sulake.habbo.toolbar.events.HabboToolbarEvent;

    public class InventoryMainView 
    {

        private static const COUNTER_MARGIN:int = 3;

        private const DEFAULT_VIEW_LOCATION:Point = new Point(120, 150);

        private var _windowManager:_SafeStr_1695;
        private var _SafeStr_3745:_SafeStr_21;
        private var _SafeStr_4079:_SafeStr_3263;
        private var _SafeStr_4941:String;
        private var _SafeStr_4949:_SafeStr_3133;
        private var _SafeStr_4942:String;
        private var _SafeStr_8635:_SafeStr_3133;
        private var _SafeStr_4360:HabboInventory;
        private var _toolbar:IHabboToolbar;
        private var _SafeStr_4943:_SafeStr_3133;
        private var _SafeStr_4944:_SafeStr_3133;
        private var _SafeStr_4946:_SafeStr_3133;
        private var _SafeStr_4945:_SafeStr_3133;
        private var _SafeStr_4947:_SafeStr_3133;
        private var _SafeStr_4948:Dictionary;

        public function InventoryMainView(_arg_1:HabboInventory, _arg_2:_SafeStr_1695, _arg_3:_SafeStr_21)
        {
            _SafeStr_4360 = _arg_1;
            _SafeStr_3745 = _arg_3;
            _windowManager = _arg_2;
        }

        public function get isVisible():Boolean
        {
            return ((_SafeStr_4079) ? _SafeStr_4079.visible : false);
        }

        public function get isActive():Boolean
        {
            return ((_SafeStr_4079) ? _SafeStr_4079.getStateFlag(1) : false);
        }

        public function get emptyContainer():_SafeStr_3133
        {
            if (!_SafeStr_4079)
            {
                return (null);
            };
            return (_SafeStr_4079.findChildByName("empty_container") as _SafeStr_3133);
        }

        public function get loadingContainer():_SafeStr_3133
        {
            if (!_SafeStr_4079)
            {
                return (null);
            };
            return (_SafeStr_4079.findChildByName("loading_container") as _SafeStr_3133);
        }

        public function get mainContainer():_SafeStr_3133
        {
            if (!_SafeStr_4079)
            {
                return (null);
            };
            return (_SafeStr_4079.findChildByName("contentArea") as _SafeStr_3133);
        }

        public function dispose():void
        {
            _SafeStr_4943 = null;
            _SafeStr_4944 = null;
            _SafeStr_4947 = null;
            _SafeStr_4945 = null;
            _SafeStr_4946 = null;
            _SafeStr_4360 = null;
            _SafeStr_4949 = null;
            _SafeStr_8635 = null;
            if (_SafeStr_4079)
            {
                _SafeStr_4079.dispose();
                _SafeStr_4079 = null;
            };
            if (_toolbar)
            {
                if (_toolbar.events)
                {
                    _toolbar.events.removeEventListener("HTE_TOOLBAR_CLICK", onHabboToolbarEvent);
                };
                _toolbar = null;
            };
            _windowManager = null;
            _SafeStr_3745 = null;
        }

        private function getWindow():_SafeStr_3263
        {
            var _local_4:* = null;
            var _local_1:* = null;
            var _local_2:* = null;
            var _local_3:* = null;
            var _local_5:* = null;
            if (!_SafeStr_4079)
            {
                _local_4 = _SafeStr_3745.getAssetByName("inventory_xml");
                _local_1 = XmlAsset(_local_4);
                _SafeStr_4948 = new Dictionary();
                _SafeStr_4079 = (_windowManager.buildFromXML(XML(_local_1.content)) as _SafeStr_3263);
                if (_SafeStr_4079 != null)
                {
                    _SafeStr_4079.position = DEFAULT_VIEW_LOCATION;
                    _SafeStr_4079.visible = false;
                    _SafeStr_4079.procedure = windowEventProc;
                    _SafeStr_4079.setParamFlag(0x10000, _SafeStr_4360.getBoolean("inventory.allow.scaling"));
                    extractWindow("furni");
                    extractWindow("pets");
                    extractWindow("bots");
                    extractWindow("badges");
                    _local_2 = (_SafeStr_4079.findChildByName("tabs") as ITabContextWindow);
                    _local_3 = [];
                    while (_local_2.numTabItems > 0)
                    {
                        _local_5 = _local_2.getTabItemAt(0);
                        _local_3.push(_local_5);
                        _local_2.removeTabItem(_local_5);
                    };
                    for each (_local_5 in _local_3)
                    {
                        switch (_local_5.name)
                        {
                            case "bots":
                                if (_SafeStr_4360.getBoolean("inventory.bots.enabled"))
                                {
                                    _local_2.addTabItem(_local_5);
                                };
                                break;
                            case "rentables":
                                if (_SafeStr_4360.getBoolean("duckets.enabled"))
                                {
                                    _local_2.addTabItem(_local_5);
                                };
                                break;
                            default:
                                _local_2.addTabItem(_local_5);
                        };
                    };
                    _SafeStr_4360.preparingInventoryView();
                };
                _SafeStr_4360.updateUnseenItemCounts();
            };
            if (_SafeStr_4079.y < 0)
            {
                _SafeStr_4079.y = 0;
            };
            if (_SafeStr_4079.x < 0)
            {
                _SafeStr_4079.x = 0;
            };
            return (_SafeStr_4079);
        }

        public function getCategoryViewId():String
        {
            return (_SafeStr_4941);
        }

        public function getSubCategoryViewId():String
        {
            return (_SafeStr_4942);
        }

        public function hideInventory():void
        {
            _SafeStr_4360.closingInventoryView();
            var _local_1:_SafeStr_3109 = getWindow();
            if (_local_1 == null)
            {
                return;
            };
            _local_1.visible = false;
        }

        public function showInventory():void
        {
            var _local_1:_SafeStr_3109 = getWindow();
            if (_local_1 == null)
            {
                return;
            };
            _local_1.visible = true;
            _SafeStr_4360.inventoryViewOpened((((_SafeStr_4942) && (_SafeStr_4942.length > 0)) ? _SafeStr_4942 : _SafeStr_4941));
        }

        public function toggleCategoryView(_arg_1:String, _arg_2:Boolean=true, _arg_3:Boolean=false):Boolean
        {
            var _local_4:_SafeStr_3109 = getWindow();
            if (_local_4 == null)
            {
                return (false);
            };
            if (_local_4.visible)
            {
                if (_SafeStr_4941 == _arg_1)
                {
                    if (_arg_2)
                    {
                        if (WindowToggle.isHiddenByOtherWindows(_local_4))
                        {
                            _local_4.activate();
                        }
                        else
                        {
                            hideInventory();
                            return (false);
                        };
                    };
                }
                else
                {
                    setViewToCategory(_arg_1);
                };
            }
            else
            {
                if ((((_arg_3) && (!(_SafeStr_4941 == null))) && (!(_SafeStr_4941 == _arg_1))))
                {
                    setViewToCategory(_arg_1);
                };
                _local_4.visible = true;
                _local_4.activate();
                if (((!(_arg_1 == _SafeStr_4941)) || (!(_SafeStr_4360.isInventoryCategoryInit(_arg_1)))))
                {
                    setViewToCategory(_arg_1);
                };
                _SafeStr_4360.inventoryViewOpened(_arg_1);
            };
            return (true);
        }

        public function toggleSubCategoryView(_arg_1:String, _arg_2:Boolean=true):void
        {
            var _local_3:_SafeStr_3109 = getWindow();
            if (_local_3 == null)
            {
                return;
            };
            if (_local_3.visible)
            {
                if (_SafeStr_4942 == _arg_1)
                {
                    if (_arg_2)
                    {
                        _local_3.visible = false;
                    };
                }
                else
                {
                    setSubViewToCategory(_arg_1);
                };
            }
            else
            {
                _local_3.visible = true;
                if (_arg_1 != _SafeStr_4942)
                {
                    setSubViewToCategory(_arg_1);
                };
            };
        }

        public function updateSubCategoryView():void
        {
            if (_SafeStr_4942 == null)
            {
                return;
            };
            setSubViewToCategory(_SafeStr_4942);
        }

        public function setToolbar(_arg_1:IHabboToolbar):void
        {
            _toolbar = _arg_1;
            _toolbar.events.addEventListener("HTE_TOOLBAR_CLICK", onHabboToolbarEvent);
        }

        public function windowEventProc(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            var _local_3:* = null;
            if (_arg_1.type == "WE_SELECTED")
            {
                _local_3 = ITabContextWindow(_arg_2).selector.getSelected().name;
                if (_local_3 != _SafeStr_4941)
                {
                    resetUnseenCounters(_SafeStr_4941);
                    _SafeStr_4360.toggleInventoryPage(_local_3);
                };
            }
            else
            {
                if (_arg_1.type == "WME_CLICK")
                {
                    if (_arg_2.name == "header_button_close")
                    {
                        hideInventory();
                    };
                    if (_arg_2.name == "open_catalog_btn")
                    {
                        _SafeStr_4360.catalog.openCatalog();
                    };
                }
                else
                {
                    if (_arg_1.type == "WME_DOUBLE_CLICK")
                    {
                        if (_arg_2.name == "titlebar")
                        {
                            _SafeStr_4079.height = _SafeStr_4079.limits.minHeight;
                        };
                    };
                };
            };
        }

        public function updateUnseenFurniCount(_arg_1:int):void
        {
            if (!_SafeStr_4079)
            {
                return;
            };
            if (!_SafeStr_4943)
            {
                _SafeStr_4943 = createCounter("furni");
            };
            updateCounter(_SafeStr_4943, _arg_1);
            _SafeStr_4360.furniModel.updateView();
        }

        public function updateUnseenRentedFurniCount(_arg_1:int):void
        {
            if (!_SafeStr_4079)
            {
                return;
            };
            if (!_SafeStr_4944)
            {
                _SafeStr_4944 = createCounter("rentables");
            };
            updateCounter(_SafeStr_4944, _arg_1);
            _SafeStr_4360.furniModel.updateView();
        }

        public function updateUnseenPetsCount(_arg_1:int):void
        {
            if (!_SafeStr_4079)
            {
                return;
            };
            if (!_SafeStr_4945)
            {
                _SafeStr_4945 = createCounter("pets");
            };
            updateCounter(_SafeStr_4945, _arg_1);
            _SafeStr_4360.petsModel.updateView();
        }

        public function updateUnseenBadgeCount(_arg_1:int):void
        {
            if (!_SafeStr_4079)
            {
                return;
            };
            if (!_SafeStr_4946)
            {
                _SafeStr_4946 = createCounter("badges");
            };
            updateCounter(_SafeStr_4946, _arg_1);
            _SafeStr_4360.badgesModel.updateView();
        }

        public function updateUnseenBotCount(_arg_1:int):void
        {
            if (!_SafeStr_4079)
            {
                return;
            };
            if (!_SafeStr_4947)
            {
                _SafeStr_4947 = createCounter("bots");
            };
            updateCounter(_SafeStr_4947, _arg_1);
            _SafeStr_4360.botsModel.updateView();
        }

        public function getView(_arg_1:String):_SafeStr_3133
        {
            return (_SafeStr_4948[_arg_1] as _SafeStr_3133);
        }

        private function extractWindow(_arg_1:String):void
        {
            var _local_2:_SafeStr_3109 = mainContainer.getChildByName(_arg_1);
            if (_local_2)
            {
                _SafeStr_4948[_arg_1] = mainContainer.removeChild(_local_2);
            };
        }

        private function resetUnseenCounters(_arg_1:String):void
        {
            switch (_arg_1)
            {
                case "furni":
                    _SafeStr_4360.furniModel.resetUnseenItems();
                    return;
                case "rentables":
                    _SafeStr_4360.furniModel.resetUnseenItems();
                    return;
                case "pets":
                    _SafeStr_4360.petsModel.resetUnseenItems();
                    return;
                case "badges":
                    _SafeStr_4360.badgesModel.resetUnseenItems();
                    return;
                case "bots":
                    _SafeStr_4360.botsModel.resetUnseenItems();
                    return;
            };
        }

        private function setViewToCategory(_arg_1:String):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            if (_arg_1 == "")
            {
                return;
            };
            if (emptyContainer)
            {
                emptyContainer.visible = false;
            };
            if (loadingContainer)
            {
                loadingContainer.visible = false;
            };
            _SafeStr_4360.checkCategoryInitilization(_arg_1);
            if (mainContainer == null)
            {
                return;
            };
            mainContainer.removeChild(_SafeStr_4949);
            mainContainer.invalidate();
            var _local_2:_SafeStr_3133 = _SafeStr_4360.getCategoryWindowContainer(_arg_1);
            if (_local_2 == null)
            {
                return;
            };
            _local_2.visible = true;
            mainContainer.addChild(_local_2);
            _local_2.height = mainContainer.height;
            _SafeStr_4360.updateView(_arg_1);
            _SafeStr_4949 = _local_2;
            _SafeStr_4941 = _arg_1;
            var _local_3:ITabContextWindow = (_SafeStr_4079.findChildByName("tabs") as ITabContextWindow);
            if (_local_3 == null)
            {
                return;
            };
            _local_3.selector.setSelected(_local_3.selector.getSelectableByName(_arg_1));
        }

        private function enableScaling():void
        {
            _SafeStr_4079.height = _SafeStr_4079.limits.minHeight;
            _SafeStr_4079.setParamFlag(0x10000, true);
            _SafeStr_4079.findChildByName("top_content").setParamFlag(0x0800, true);
        }

        private function disableScaling():void
        {
            _SafeStr_4079.height = _SafeStr_4079.limits.minHeight;
            _SafeStr_4079.setParamFlag(0x10000, false);
            _SafeStr_4079.findChildByName("top_content").setParamFlag(0x0800, false);
        }

        private function setSubViewToCategory(_arg_1:String):void
        {
            if (((_arg_1 == null) || (_arg_1 == "")))
            {
                return;
            };
            _SafeStr_4360.checkCategoryInitilization(_arg_1);
            var _local_2:_SafeStr_3133 = (_SafeStr_4079.findChildByName("subContentArea") as _SafeStr_3133);
            while (_local_2.numChildren > 0)
            {
                _local_2.removeChildAt(0);
            };
            var _local_3:_SafeStr_3133 = _SafeStr_4360.getCategorySubWindowContainer(_arg_1);
            if (_local_3 != null)
            {
                disableScaling();
                _local_2.visible = true;
                _local_3.visible = true;
                _local_2.height = _local_3.height;
                _local_2.addChild(_local_3);
            }
            else
            {
                enableScaling();
                _local_2.visible = false;
                _local_2.height = 0;
            };
            _local_2.y = (_SafeStr_4079.findChildByName("top_content").rectangle.bottom + 5);
            _SafeStr_4079.resizeToFitContent();
            if (_SafeStr_4079.parent != null)
            {
                if ((_SafeStr_4079.x + _SafeStr_4079.width) > _SafeStr_4079.parent.width)
                {
                    _SafeStr_4079.x = (_SafeStr_4079.parent.width - _SafeStr_4079.width);
                };
                if ((_SafeStr_4079.y + _SafeStr_4079.height) > _SafeStr_4079.parent.height)
                {
                    _SafeStr_4079.y = ((_SafeStr_4079.parent.height - _SafeStr_4079.height) * 0.5);
                };
                if (_SafeStr_4079.y < 0)
                {
                    _SafeStr_4079.y = 0;
                };
            };
            _SafeStr_8635 = _local_3;
            _SafeStr_4942 = _arg_1;
        }

        private function createCounter(_arg_1:String):_SafeStr_3133
        {
            var _local_3:_SafeStr_3133 = _windowManager.createUnseenItemCounter();
            var _local_2:_SafeStr_3133 = (_SafeStr_4079.findChildByName(_arg_1) as _SafeStr_3133);
            if (_local_2)
            {
                _local_2.addChild(_local_3);
                _local_3.x = ((_local_2.width - _local_3.width) - 3);
                _local_3.y = 3;
            };
            return (_local_3);
        }

        private function updateCounter(_arg_1:_SafeStr_3133, _arg_2:int):void
        {
            var _local_5:* = null;
            _arg_1.findChildByName("count").caption = _arg_2.toString();
            _arg_1.visible = (_arg_2 > 0);
            var _local_3:String = "";
            switch (_arg_1)
            {
                case _SafeStr_4947:
                    _local_3 = "bots";
                    break;
                case _SafeStr_4945:
                    _local_3 = "pets";
                    break;
                case _SafeStr_4946:
                    _local_3 = "badges";
                    break;
                case _SafeStr_4943:
                    _local_3 = "furni";
                    break;
                case _SafeStr_4944:
                    _local_3 = "rentables";
            };
            var _local_4:_SafeStr_3133 = (_SafeStr_4079.findChildByName(_local_3) as _SafeStr_3133);
            if (_local_4)
            {
                _local_5 = (_local_4.getChildByTag("TITLE") as ILabelWindow);
                if (_local_5)
                {
                    if (_arg_1.visible)
                    {
                        _local_5.margins.right = (_arg_1.width + (2 * 3));
                    }
                    else
                    {
                        _local_5.margins.right = _local_5.margins.left;
                    };
                    _local_4.width = _local_5.width;
                    _arg_1.x = ((_local_4.width - _arg_1.width) - 3);
                };
            };
        }

        public function onHabboToolbarEvent(_arg_1:HabboToolbarEvent):void
        {
            if (_arg_1.iconId != "HTIE_ICON_INVENTORY")
            {
                return;
            };
            if (_arg_1.type == "HTE_TOOLBAR_CLICK")
            {
                if (_SafeStr_4941 == "pets")
                {
                    toggleCategoryView("pets");
                }
                else
                {
                    if (_SafeStr_4941 == "furni")
                    {
                        toggleCategoryView("furni");
                    }
                    else
                    {
                        if (_SafeStr_4941 == "rentables")
                        {
                            toggleCategoryView("rentables");
                        }
                        else
                        {
                            if (_SafeStr_4941 == "badges")
                            {
                                toggleCategoryView("badges");
                            }
                            else
                            {
                                if (_SafeStr_4941 == "bots")
                                {
                                    toggleCategoryView("bots");
                                }
                                else
                                {
                                    if (_SafeStr_4360 != null)
                                    {
                                        _SafeStr_4360.toggleInventoryPage("furni");
                                    };
                                };
                            };
                        };
                    };
                };
            };
        }


    }
}//package com.sulake.habbo.inventory

// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_3745 = "_-4b" (String#920, DoABC#4)
// _SafeStr_4079 = "_-f1q" (String#323, DoABC#4)
// _SafeStr_4360 = "_-58" (String#91, DoABC#4)
// _SafeStr_4941 = "_-U1R" (String#4699, DoABC#4)
// _SafeStr_4942 = "_-kk" (String#6979, DoABC#4)
// _SafeStr_4943 = "_-214" (String#9782, DoABC#4)
// _SafeStr_4944 = "_-v1r" (String#9123, DoABC#4)
// _SafeStr_4945 = "_-U1v" (String#9570, DoABC#4)
// _SafeStr_4946 = "_-F1f" (String#10262, DoABC#4)
// _SafeStr_4947 = "_-h1K" (String#9801, DoABC#4)
// _SafeStr_4948 = "_-Gh" (String#14633, DoABC#4)
// _SafeStr_4949 = "_-D1N" (String#11566, DoABC#4)
// _SafeStr_8635 = "_-I1H" (String#14685, DoABC#4)


