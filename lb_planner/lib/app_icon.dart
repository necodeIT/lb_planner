/// The svg code of the icon for the app.
const kAppIcon = '''
<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="158" height="158" viewBox="0 0 158 158">
  <defs>
    <filter id="Background" x="0" y="0" width="158" height="158" filterUnits="userSpaceOnUse">
      <feOffset dy="3" input="SourceAlpha"/>
      <feGaussianBlur stdDeviation="12" result="blur"/>
      <feFlood flood-opacity="0.161"/>
      <feComposite operator="in" in2="blur"/>
      <feComposite in="SourceGraphic"/>
    </filter>
  </defs>
  <g id="Group_75" data-name="Group 75" transform="translate(-12.5 -15.5)">
    <g transform="matrix(1, 0, 0, 1, 12.5, 15.5)" filter="url(#Background)">
      <rect id="Background-2" data-name="Background" width="86" height="86" rx="13" transform="translate(36 33)" fill="#1d1d1d"/>
    </g>
    <g id="Logo" transform="translate(60.886 64.5)">
      <text id="LP" transform="translate(23 44)" fill="#fff" font-size="41" font-family="SegoeUI-Bold, Segoe UI" font-weight="700"><tspan x="-23.073" y="0">LP</tspan></text>
      <path id="Path_13" data-name="Path 13" d="M-2975.339,4671.468l13.454,11.934v-11.934Z" transform="translate(3023.116 -4655.125)" fill="#27bcf3"/>
    </g>
  </g>
</svg>
''';
