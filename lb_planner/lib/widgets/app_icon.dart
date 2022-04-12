part of lbplanner_widgets;

/// The svg code of the icon for the app.
const kAppIcon = '''
<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="353" height="353" viewBox="0 0 353 353">
  <defs>
    <filter id="Background" x="0" y="0" width="353" height="353" filterUnits="userSpaceOnUse">
      <feOffset dy="3" input="SourceAlpha"/>
      <feGaussianBlur stdDeviation="12" result="blur"/>
      <feFlood flood-opacity="0.161"/>
      <feComposite operator="in" in2="blur"/>
      <feComposite in="SourceGraphic"/>
    </filter>
  </defs>
  <g id="Icon" transform="translate(36 33)">
    <g transform="matrix(1, 0, 0, 1, -36, -33)" filter="url(#Background)">
      <rect id="Background-2" data-name="Background" width="281" height="281" rx="33" transform="translate(36 33)" fill="#1d1d1d"/>
    </g>
    <text id="LP" transform="translate(114 202)" fill="#fff" font-size="150" font-family="SegoeUI-Bold, Segoe UI" font-weight="700"><tspan x="-84.412" y="0">LP</tspan></text>
    <path id="Path_13" data-name="Path 13" d="M-2975.34,4671.469l48.5,43.064v-43.064Z" transform="translate(3177.614 -4572.564)" fill="#27bcf3"/>
  </g>
</svg>
''';
