// by nota

//com.sulake.habbo.window.HabboWindowManagerComponent

package com.sulake.habbo.window
{
    import com.sulake.core.runtime._SafeStr_20;
    import com.sulake.core.window._SafeStr_1694;
    import com.sulake.core.window._SafeStr_1693;
    import com.sulake.core.runtime._SafeStr_41;
    import com.sulake.core.window.IInputEventTracker;
    import com.sulake.core.window._SafeStr_1692;
    import flash.events.Event;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.core.window._SafeStr_3160;
    import com.sulake.core.window.graphics._SafeStr_3119;
    import com.sulake.core.window.graphics.SkinContainer;
    import com.sulake.core.window.tools.ProfilerOutput;
    import com.sulake.core.utils.profiler.ProfilerAgentTask;
    import com.sulake.habbo.window.theme.ThemeManager;
    import com.sulake.habbo.avatar._SafeStr_1701;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.window.utils.floorplaneditor.BCFloorPlanEditor;
    import com.sulake.habbo.window.utils.habbopedia.HabboPagesViewer;
    import com.sulake.habbo.window.handlers.HabbletLinkHandler;
    import com.sulake.habbo.window.utils.ElementPointerHandler;
    import com.sulake.core.utils._SafeStr_278;
    import com.sulake.core.window.components.HTMLTextController;
    import com.sulake.core.runtime._SafeStr_31;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDSessionDataManager;
    import com.sulake.iid.IIDHabboLocalizationManager;
    import com.sulake.iid.IIDHabboConfigurationManager;
    import com.sulake.core.runtime._SafeStr_19;
    import com.sulake.iid.IIDAvatarRenderManager;
    import com.sulake.iid.IIDHabboCommunicationManager;
    import com.sulake.iid.IIDRoomEngine;
    import __AS3__.vec.Vector;
    import flash.utils.getTimer;
    import com.sulake.core.assets.IAsset;
    import com.sulake.habbo.window.utils._SafeStr_3252;
    import com.sulake.core.window.graphics.WindowRenderer;
    import flash.geom.Rectangle;
    import com.sulake.core.window.WindowContext;
    import com.sulake.core.runtime.IIDProfiler;
    import flash.external.ExternalInterface;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.runtime._SafeStr_1099;
    import com.sulake.core.runtime.IID;
    import com.sulake.core.runtime.IUnknown;
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.core.window.utils.DefaultAttStruct;
    import com.sulake.core.window.components._SafeStr_3216;
    import com.sulake.habbo.window.utils.AlertDialog;
    import com.sulake.core.window.utils.INotify;
    import com.sulake.habbo.window.utils._SafeStr_3114;
    import com.sulake.habbo.window.utils.AlertDialogWithLink;
    import com.sulake.habbo.window.utils._SafeStr_3126;
    import com.sulake.habbo.window.utils.ConfirmDialog;
    import com.sulake.habbo.window.utils._SafeStr_3198;
    import com.sulake.core.window.utils.MouseCursorControl;
    import com.sulake.core.utils.ErrorReportStorage;
    import com.sulake.core.window.events._SafeStr_3116;
    import flash.system.Capabilities;
    import com.sulake.core.window.theme.IThemeManager;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.window.widgets._SafeStr_3227;
    import com.sulake.core.window.components._SafeStr_3199;
    import com.sulake.core.window._SafeStr_3179;
    import com.sulake.core.assets.IResourceManager;
    import com.sulake.habbo.window.utils.ModalDialog;
    import com.sulake.habbo.window.utils.IModalDialog;
    import com.sulake.habbo.window.utils.SimpleAlertDialog;
    import flash.text.StyleSheet;
    import com.sulake.core.window.events.*;
    import com.sulake.core.window.tools.*;

    public class HabboWindowManagerComponent extends _SafeStr_20 implements _SafeStr_1695, _SafeStr_1694, _SafeStr_1693, _SafeStr_41, IInputEventTracker, _SafeStr_1692 
    {

        private static const TRACKING_EVENT_INPUT:Event = new Event("HABBO_WINDOW_TRACKING_EVENT_INPUT");
        private static const TRACKING_EVENT_RENDER:Event = new Event("HABBO_WINDOW_TRACKING_EVENT_RENDER");
        private static const TRACKING_EVENT_SLEEP:Event = new Event("HABBO_WINDOW_TRACKING_EVENT_SLEEP");
        private static const NUMBER_OF_CONTEXT_LAYERS:uint = 4;
        private static const DEFAULT_CONTEXT_LAYER_INDEX:uint = 1;

        private var _localization:_SafeStr_18;
        private var _windowContextArray:Array;
        private var _SafeStr_3728:_SafeStr_3160;
        private var _windowRenderer:_SafeStr_3119;
        private var _SafeStr_3722:SkinContainer;
        private var _SafeStr_3729:Boolean = false;
        private var _SafeStr_3725:ProfilerOutput;
        private var _profilerAgentTaskUpdate:ProfilerAgentTask;
        private var _profilerAgentTaskRedraw:ProfilerAgentTask;
        private var _SafeStr_3730:ThemeManager;
        private var _SafeStr_3723:ResourceManager;
        private var _hintManager:HintManager;
        private var _avatarRenderer:_SafeStr_1701;
        private var _communication:IHabboCommunicationManager;
        private var _sessionDataManager:ISessionDataManager;
        private var _SafeStr_3883:Boolean = false;
        private var _roomEngine:IRoomEngine;
        private var _SafeStr_9189:uint;
        private var _bcfloorPlanEditor:BCFloorPlanEditor;
        private var _SafeStr_3727:HabboPagesViewer;
        private var _SafeStr_3724:HabbletLinkHandler;
        private var _SafeStr_3726:ElementPointerHandler;

        public function HabboWindowManagerComponent(_arg_1:_SafeStr_31, _arg_2:uint=0, _arg_3:_SafeStr_21=null)
        {
            super(_arg_1, _arg_2, _arg_3);
            _SafeStr_278.refresh();
            HTMLTextController.defaultLinkTarget = "habboMain";
        }

        public function get roomEngine():IRoomEngine
        {
            return (_roomEngine);
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDSessionDataManager(), function (_arg_1:ISessionDataManager):void
            {
                _sessionDataManager = _arg_1;
            }, false), new ComponentDependency(new IIDHabboLocalizationManager(), function (_arg_1:_SafeStr_18):void
            {
                _localization = _arg_1;
            }), new ComponentDependency(new IIDHabboConfigurationManager(), function (_arg_1:_SafeStr_19):void
            {
            }, false, [{
                "type":"complete",
                "callback":onConfigurationComplete
            }]), new ComponentDependency(new IIDAvatarRenderManager(), function (_arg_1:_SafeStr_1701):void
            {
                _avatarRenderer = _arg_1;
            }, false), new ComponentDependency(new IIDHabboCommunicationManager(), setCommunicationManager, false), new ComponentDependency(new IIDRoomEngine(), function (_arg_1:IRoomEngine):void
            {
                _roomEngine = _arg_1;
            }, false)]));
        }

        private function setCommunicationManager(_arg_1:IHabboCommunicationManager):void
        {
            _communication = _arg_1;
        }

        private function onConfigurationComplete(_arg_1:Event):void
        {
            if (_communication != null)
            {
                _bcfloorPlanEditor = new BCFloorPlanEditor(this);
                _SafeStr_3726 = new ElementPointerHandler(this);
            };
        }

        override protected function initComponent():void
        {
            var _local_3:uint;
            var _local_1:int = getTimer();
            var _local_2:IAsset = assets.getAssetByName("habbo_element_description_xml");
            _SafeStr_3722 = new SkinContainer();
            _SafeStr_3252.parse((_local_2.content as XML), assets, _SafeStr_3722);
            _SafeStr_3730 = new ThemeManager(_SafeStr_3722);
            _SafeStr_3723 = new ResourceManager(this);
            _hintManager = new HintManager(this);
            _windowRenderer = new WindowRenderer(_SafeStr_3722);
            _windowContextArray = new Array(4);
            var _local_4:Rectangle = new Rectangle(0, 0, context.displayObjectContainer.stage.stageWidth, context.displayObjectContainer.stage.stageHeight);
            _local_3 = 0;
            while (_local_3 < 4)
            {
                _windowContextArray[_local_3] = new WindowContext(("layer_" + _local_3), _windowRenderer, this, this, _SafeStr_3723, _localization, this, context.displayObjectContainer, _local_4, context.linkEventTrackers);
                _local_3++;
            };
            assets.removeAsset(_local_2);
            _local_2.dispose();
            _SafeStr_3728 = _windowContextArray[1];
            addMouseEventTracker(this);
            registerUpdateReceiver(this, 0);
            queueInterface(new IIDProfiler(), receiveProfilerInterface);
            _local_1 = (getTimer() - _local_1);
            _SafeStr_14.log((("initializing window framework took " + _local_1) + "ms"));
            _SafeStr_3883 = true;
            _SafeStr_3727 = new HabboPagesViewer(this);
            _SafeStr_3724 = new HabbletLinkHandler(this);
            context.addLinkEventTracker(_SafeStr_3724);
            if (ExternalInterface.available)
            {
                ExternalInterface.addCallback("openlink", context.createLinkEvent);
            };
        }

        public function toggleFullScreen():void
        {
            if (context.displayObjectContainer.stage.displayState == "fullScreenInteractive")
            {
                context.displayObjectContainer.stage.displayState = "normal";
            }
            else
            {
                context.displayObjectContainer.stage.displayState = "fullScreenInteractive";
            };
        }

        private function onCrashTest(_arg_1:WindowMouseEvent):void
        {
            var _local_2:* = null;
            _SafeStr_14.log("CRASH!");
            _local_2.background = true;
        }

        private function receiveProfilerInterface(_arg_1:IID, _arg_2:IUnknown):void
        {
            var _local_3:_SafeStr_1099 = (_arg_2 as _SafeStr_1099);
            if (_local_3 != null)
            {
                if (!_SafeStr_3725)
                {
                    _SafeStr_3725 = new ProfilerOutput(context, this, _windowRenderer);
                };
                _SafeStr_3725.profiler = _local_3;
                _profilerAgentTaskUpdate = new ProfilerAgentTask("Update", "Event processing");
                _local_3.getProfilerAgentForReceiver(this).addSubTask(_profilerAgentTaskUpdate);
                _profilerAgentTaskRedraw = new ProfilerAgentTask("Redraw", "Window rasterizer");
                _local_3.getProfilerAgentForReceiver(this).addSubTask(_profilerAgentTaskRedraw);
                _SafeStr_3729 = true;
            };
        }

        private function receiveLoggerInterface(_arg_1:IID, _arg_2:IUnknown):void
        {
        }

        override public function dispose():void
        {
            if (!disposed)
            {
                if (_SafeStr_3724 != null)
                {
                    context.removeLinkEventTracker(_SafeStr_3724);
                    _SafeStr_3724.dispose();
                    _SafeStr_3724 = null;
                };
                if (_SafeStr_3726 != null)
                {
                    _SafeStr_3726.dispose();
                    _SafeStr_3726 = null;
                };
                removeUpdateReceiver(this);
                if (_bcfloorPlanEditor != null)
                {
                    _bcfloorPlanEditor.dispose();
                    _bcfloorPlanEditor = null;
                };
                if (_SafeStr_3727)
                {
                    _SafeStr_3727.dispose();
                    _SafeStr_3727 = null;
                };
                if (_windowContextArray)
                {
                    while (_windowContextArray.length > 0)
                    {
                        _SafeStr_13(_windowContextArray.pop()).dispose();
                    };
                };
                _windowContextArray = null;
                if (_windowRenderer)
                {
                    _windowRenderer.dispose();
                    _windowRenderer = null;
                };
                if (_SafeStr_3722)
                {
                    _SafeStr_3722.dispose();
                    _SafeStr_3722 = null;
                };
                if (_SafeStr_3723 != null)
                {
                    _SafeStr_3723.dispose();
                    _SafeStr_3723 = null;
                };
                if (_hintManager != null)
                {
                    _hintManager.dispose();
                    _hintManager = null;
                };
                super.dispose();
            };
        }

        public function create(_arg_1:String, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:Rectangle, _arg_6:Function=null, _arg_7:String="", _arg_8:uint=0, _arg_9:Array=null, _arg_10:_SafeStr_3109=null, _arg_11:Array=null, _arg_12:String=""):_SafeStr_3109
        {
            return (_SafeStr_3728.create(_arg_1, _arg_7, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_10, _arg_8, _arg_11, _arg_12, _arg_9));
        }

        public function destroy(_arg_1:_SafeStr_3109):void
        {
            _arg_1.destroy();
        }

        public function buildFromXML(_arg_1:XML, _arg_2:uint=1, _arg_3:_SafeStr_24=null):_SafeStr_3109
        {
            var _local_4:_SafeStr_3109 = getWindowContext(_arg_2).getWindowParser().parseAndConstruct(_arg_1, null, _arg_3);
            if ((_local_4 is _SafeStr_3263))
            {
                _SafeStr_3263(_local_4).helpButtonAction = openHelpPage;
            };
            return (_local_4);
        }

        public function windowToXMLString(_arg_1:_SafeStr_3109):String
        {
            return (_SafeStr_3728.getWindowParser().windowToXMLString(_arg_1));
        }

        public function getLayoutByTypeAndStyle(_arg_1:uint, _arg_2:uint):XML
        {
            return (_SafeStr_3722.getWindowLayoutByTypeAndStyle(_arg_1, _arg_2));
        }

        public function getDefaultsByTypeAndStyle(_arg_1:uint, _arg_2:uint):DefaultAttStruct
        {
            return (_SafeStr_3722.getDefaultAttributesByTypeAndStyle(_arg_1, _arg_2));
        }

        public function createWindow(_arg_1:String, _arg_2:String="", _arg_3:uint=0, _arg_4:uint=0, _arg_5:uint=0, _arg_6:Rectangle=null, _arg_7:Function=null, _arg_8:uint=0, _arg_9:uint=1, _arg_10:String=""):_SafeStr_3109
        {
            return (_windowContextArray[_arg_9].create(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, null, _arg_8, null, null, null));
        }

        public function removeWindow(_arg_1:String, _arg_2:uint=1):void
        {
            var _local_3:* = null;
            _local_3 = _windowContextArray[_arg_2].getDesktopWindow();
            var _local_4:_SafeStr_3109 = _local_3.getChildByName(_arg_1);
            if (_local_4 != null)
            {
                _local_4.destroy();
            };
        }

        public function getWindowByName(_arg_1:String, _arg_2:uint=1):_SafeStr_3109
        {
            return (_windowContextArray[_arg_2].getDesktopWindow().getChildByName(_arg_1));
        }

        public function getActiveWindow(_arg_1:uint=1):_SafeStr_3109
        {
            return (_windowContextArray[_arg_1].getDesktopWindow().getChildAt((_SafeStr_3728.getDesktopWindow().numChildren - 1)));
        }

        public function getWindowContext(_arg_1:uint):_SafeStr_3160
        {
            return (_windowContextArray[_arg_1]);
        }

        public function getDesktop(_arg_1:uint):_SafeStr_3216
        {
            var _local_2:_SafeStr_3160 = _windowContextArray[_arg_1];
            return ((_local_2) ? _local_2.getDesktopWindow() : null);
        }

        public function notify(_arg_1:String, _arg_2:String, _arg_3:Function, _arg_4:uint=0):INotify
        {
            var _local_6:IAsset = assets.getAssetByName("habbo_window_alert_xml");
            if (!_local_6)
            {
                throw (new Error("Failed to initialize alert dialog; missing asset!"));
            };
            var _local_5:XML = (_local_6.content as XML);
            return (new AlertDialog(this, _local_5, _arg_1, _arg_2, _arg_4, _arg_3, false));
        }

        public function alert(_arg_1:String, _arg_2:String, _arg_3:uint, _arg_4:Function):_SafeStr_3114
        {
            var _local_6:IAsset = assets.getAssetByName("habbo_window_alert_xml");
            if (!_local_6)
            {
                throw (new Error("Failed to initialize alert dialog; missing asset!"));
            };
            var _local_5:XML = (_local_6.content as XML);
            return (new AlertDialog(this, _local_5, _arg_1, _arg_2, _arg_3, _arg_4, false));
        }

        public function alertWithModal(_arg_1:String, _arg_2:String, _arg_3:uint, _arg_4:Function):_SafeStr_3114
        {
            var _local_6:IAsset = assets.getAssetByName("habbo_window_alert_xml");
            if (!_local_6)
            {
                throw (new Error("Failed to initialize alert dialog; missing asset!"));
            };
            var _local_5:XML = (_local_6.content as XML);
            return (new AlertDialog(this, _local_5, _arg_1, _arg_2, _arg_3, _arg_4, true));
        }

        public function alertWithLink(_arg_1:String, _arg_2:String, _arg_3:String, _arg_4:String, _arg_5:uint, _arg_6:Function):_SafeStr_3126
        {
            var _local_8:IAsset = assets.getAssetByName("habbo_window_alert_link_xml");
            if (!_local_8)
            {
                throw (new Error("Failed to initialize alert dialog; missing asset!"));
            };
            var _local_7:XML = (_local_8.content as XML);
            return (new AlertDialogWithLink(this, _local_7, _arg_1, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6));
        }

        public function confirm(_arg_1:String, _arg_2:String, _arg_3:uint, _arg_4:Function):_SafeStr_3198
        {
            var _local_6:IAsset = assets.getAssetByName("habbo_window_confirm_xml");
            if (!_local_6)
            {
                throw (new Error("Failed to initialize aleret dialog; missing asset!"));
            };
            var _local_5:XML = (_local_6.content as XML);
            return (new ConfirmDialog(this, _local_5, _arg_1, _arg_2, _arg_3, _arg_4, false));
        }

        public function confirmWithModal(_arg_1:String, _arg_2:String, _arg_3:uint, _arg_4:Function):_SafeStr_3198
        {
            var _local_6:IAsset = assets.getAssetByName("habbo_window_confirm_xml");
            if (!_local_6)
            {
                throw (new Error("Failed to initialize aleret dialog; missing asset!"));
            };
            var _local_5:XML = (_local_6.content as XML);
            return (new ConfirmDialog(this, _local_5, _arg_1, _arg_2, _arg_3, _arg_4, true));
        }

        public function registerLocalizationParameter(_arg_1:String, _arg_2:String, _arg_3:String, _arg_4:String="%"):void
        {
            _localization.registerParameter(_arg_1, _arg_2, _arg_3, _arg_4);
        }

        public function update(_arg_1:uint):void
        {
            var _local_2:int;
            if (_SafeStr_3729)
            {
                _profilerAgentTaskUpdate.start();
            };
            if (WindowContext.inputEventQueue.length > 0)
            {
                events.dispatchEvent(TRACKING_EVENT_INPUT);
                _local_2 = (4 - 1);
                while (_local_2 >= 0)
                {
                    _windowContextArray[_local_2].update(_arg_1);
                    _local_2--;
                };
            };
            if (_SafeStr_3729)
            {
                _profilerAgentTaskUpdate.stop();
            };
            if (_SafeStr_3729)
            {
                _profilerAgentTaskRedraw.start();
            };
            events.dispatchEvent(TRACKING_EVENT_RENDER);
            _local_2 = 0;
            while (_local_2 < 4)
            {
                _windowContextArray[_local_2].render(_arg_1);
                _local_2++;
            };
            if (_SafeStr_3729)
            {
                _profilerAgentTaskRedraw.stop();
            };
            if (WindowContext.inputEventQueue.length > 0)
            {
                WindowContext.inputEventQueue.flush();
            };
            MouseCursorControl.change();
            events.dispatchEvent(TRACKING_EVENT_SLEEP);
        }

        override public function purge():void
        {
            super.purge();
            if (_windowRenderer)
            {
                _windowRenderer.purge();
            };
        }

        public function addMouseEventTracker(_arg_1:IInputEventTracker):void
        {
            for each (var _local_2:_SafeStr_3160 in _windowContextArray)
            {
                _local_2.addMouseEventTracker(_arg_1);
            };
        }

        public function removeMouseEventTracker(_arg_1:IInputEventTracker):void
        {
            for each (var _local_2:_SafeStr_3160 in _windowContextArray)
            {
                _local_2.removeMouseEventTracker(_arg_1);
            };
        }

        public function eventReceived(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_2 != null)
            {
                if (_arg_1.type == "WME_CLICK")
                {
                    ErrorReportStorage.setParameter("click_time", new Date().getTime().toString());
                    ErrorReportStorage.setParameter("click_target", ((_arg_2.name + ": ") + _arg_2.toString()));
                }
                else
                {
                    if (_arg_1.type == "WME_UP")
                    {
                        ErrorReportStorage.setParameter("mouse_up_time", new Date().getTime().toString());
                        ErrorReportStorage.setParameter("mouse_up_target", ((_arg_2.name + ": ") + _arg_2.toString()));
                    };
                };
            };
        }

        private function performTestCases():void
        {
            _SafeStr_14.log(((((("type: " + Capabilities.playerType) + " debugger: ") + Capabilities.isDebugger) + " version: ") + Capabilities.version));
        }

        public function findWindowByName(_arg_1:String):_SafeStr_3109
        {
            var _local_2:* = null;
            for each (var _local_3:_SafeStr_3160 in _windowContextArray)
            {
                _local_2 = _local_3.findWindowByName(_arg_1);
                if (_local_2)
                {
                    return (_local_2);
                };
            };
            return (null);
        }

        public function findWindowByTag(_arg_1:String):_SafeStr_3109
        {
            var _local_2:* = null;
            for each (var _local_3:_SafeStr_3160 in _windowContextArray)
            {
                _local_2 = _local_3.findWindowByTag(_arg_1);
                if (_local_2)
                {
                    return (_local_2);
                };
            };
            return (null);
        }

        public function groupWindowsWithTag(_arg_1:String, _arg_2:Array, _arg_3:int=0):uint
        {
            var _local_4:uint;
            for each (var _local_5:_SafeStr_3160 in _windowContextArray)
            {
                _local_4 = (_local_4 + _local_5.groupChildrenWithTag(_arg_1, _arg_2, _arg_3));
            };
            return (_local_4);
        }

        public function getThemeManager():IThemeManager
        {
            return (_SafeStr_3730);
        }

        public function createUnseenItemCounter():_SafeStr_3133
        {
            var _local_1:IAsset = (assets.getAssetByName("unseen_item_counter_xml") as IAsset);
            var _local_2:XML = (_local_1.content as XML);
            return (buildFromXML(_local_2) as _SafeStr_3133);
        }

        public function createWidget(_arg_1:String, _arg_2:_SafeStr_3199):_SafeStr_3179
        {
            var _local_3:Class = _SafeStr_3227._SafeStr_3731[_arg_1];
            if (_local_3 != null)
            {
                return (new _local_3(_arg_2, this));
            };
            throw (new Error((("Unknown widget type " + _arg_1) + "! You might need to update Glaze to be able to work on this layout.")));
        }

        public function get avatarRenderer():_SafeStr_1701
        {
            return (_avatarRenderer);
        }

        public function get resourceManager():IResourceManager
        {
            return (_SafeStr_3723);
        }

        public function get localization():_SafeStr_18
        {
            return (_localization);
        }

        public function buildModalDialogFromXML(_arg_1:XML):IModalDialog
        {
            return (new ModalDialog(this, _arg_1));
        }

        public function get communication():IHabboCommunicationManager
        {
            return (_communication);
        }

        public function get sessionDataManager():ISessionDataManager
        {
            return (_sessionDataManager);
        }

        public function simpleAlert(_arg_1:String, _arg_2:String, _arg_3:String, _arg_4:String=null, _arg_5:String=null, _arg_6:_SafeStr_24=null, _arg_7:String=null, _arg_8:Function=null, _arg_9:Function=null):void
        {
            new SimpleAlertDialog(this, _arg_1, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9); //not popped
        }

        public function registerHintWindow(_arg_1:String, _arg_2:_SafeStr_3109, _arg_3:int=1):void
        {
            _hintManager.registerWindow(_arg_1, _arg_2, _arg_3);
        }

        public function unregisterHintWindow(_arg_1:String):void
        {
            _hintManager.unregisterWindow(_arg_1);
        }

        public function showHint(_arg_1:String, _arg_2:Rectangle=null):void
        {
            _hintManager.showHint(_arg_1, _arg_2);
        }

        public function hideHint():void
        {
            _hintManager.hideHint();
        }

        public function hideMatchingHint(_arg_1:String):void
        {
            _hintManager.hideMatchingHint(_arg_1);
        }

        public function displayFloorPlanEditor():void
        {
            if (_bcfloorPlanEditor == null)
            {
                _bcfloorPlanEditor = new BCFloorPlanEditor(this);
            };
            if (_bcfloorPlanEditor != null)
            {
                _bcfloorPlanEditor.visible = true;
            };
        }

        public function openHelpPage(_arg_1:String):void
        {
            if (_SafeStr_3727 != null)
            {
                _SafeStr_3727.openPage(_arg_1);
            };
        }

        public function get habboPagesStyleSheet():StyleSheet
        {
            return (HabboPagesViewer.styleSheet);
        }


    }
}//package com.sulake.habbo.window

// _SafeStr_1099 = "_-Vm" (String#11834, DoABC#4)
// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1692 = "_-bT" (String#10055, DoABC#4)
// _SafeStr_1693 = "_-mi" (String#10645, DoABC#4)
// _SafeStr_1694 = "_-41e" (String#5816, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_1701 = "_-FF" (String#1596, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_19 = "_-01r" (String#1323, DoABC#4)
// _SafeStr_20 = "_-W1o" (String#542, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_25 = "_-G19" (String#757, DoABC#4)
// _SafeStr_278 = "_-3P" (String#22296, DoABC#4)
// _SafeStr_31 = "_-Ee" (String#1238, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3114 = "_-b1E" (String#1258, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3119 = "_-y1F" (String#6445, DoABC#4)
// _SafeStr_3126 = "_-c1" (String#11584, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3160 = "_-dQ" (String#2821, DoABC#4)
// _SafeStr_3179 = "_-wC" (String#2737, DoABC#4)
// _SafeStr_3198 = "_-S1O" (String#2743, DoABC#4)
// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_3216 = "_-o1L" (String#2319, DoABC#4)
// _SafeStr_3227 = "_-R2" (String#15184, DoABC#4)
// _SafeStr_3252 = "_-MU" (String#18882, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_3722 = "_-x19" (String#2558, DoABC#4)
// _SafeStr_3723 = "_-71E" (String#4944, DoABC#4)
// _SafeStr_3724 = "_-31y" (String#8411, DoABC#4)
// _SafeStr_3725 = "_-01L" (String#14911, DoABC#4)
// _SafeStr_3726 = "_-O1y" (String#11022, DoABC#4)
// _SafeStr_3727 = "_-3X" (String#8503, DoABC#4)
// _SafeStr_3728 = "_-B1C" (String#3610, DoABC#4)
// _SafeStr_3729 = "_-mq" (String#10673, DoABC#4)
// _SafeStr_3730 = "_-b1h" (String#15869, DoABC#4)
// _SafeStr_3731 = "_-YD" (String#2940, DoABC#4)
// _SafeStr_3883 = "_-w1c" (String#683, DoABC#4)
// _SafeStr_41 = "_-m5" (String#2087, DoABC#4)
// _SafeStr_9189 = "_-12j" (String#34751, DoABC#4)


