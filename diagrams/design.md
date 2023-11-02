[![Class Diagram](https://mermaid.ink/img/pako:eNplkT1uwzAMha9CcErQnMBrf6Z0SVYvrETbQi2xoKg2QZC7V01Sx241kZ8e-R6kEzrxjA26kXJ-CtQrxTZBPRcCr6R5J5-spysFeNiKIwuSwBVVTvbbTwI-sCvGKycxUvL5RSU-k9qwvkrOc4Np22QA8CiiPiQyzuDu9V2wNw2pBx-U3dy6moOKVfGWO1ut__Nd6Ic_F53oF6nPS_pG7n2BF6nnCWfBQzI4LNvjbRo3GFkjBV9f-zLSog0cucWmlp47KqO12KYfKRWT_TE5bEwLb7B8-Op1-x9sOhozn78BHE-Lfw?type=png)](https://mermaid.live/edit#pako:eNplkT1uwzAMha9CcErQnMBrf6Z0SVYvrETbQi2xoKg2QZC7V01Sx241kZ8e-R6kEzrxjA26kXJ-CtQrxTZBPRcCr6R5J5-spysFeNiKIwuSwBVVTvbbTwI-sCvGKycxUvL5RSU-k9qwvkrOc4Np22QA8CiiPiQyzuDu9V2wNw2pBx-U3dy6moOKVfGWO1ut__Nd6Ic_F53oF6nPS_pG7n2BF6nnCWfBQzI4LNvjbRo3GFkjBV9f-zLSog0cucWmlp47KqO12KYfKRWT_TE5bEwLb7B8-Op1-x9sOhozn78BHE-Lfw)
[![](https://mermaid.ink/img/pako:eNqdUbFOxDAM_RUrE4giwYY63AIjxwBrFytxe5FS-8514NDp_p20pSoHG54iv-eX9_ROzksgV7uBDpnY01PETrFvGMo8pkhst5vNzRZ1gFd5J62BjuSz0VV7PbNWbGQ-i0eLwjW0oh-oYZhZy_63GtPRgEVtBy36yB2kbybMh5gWfC-J5t04L2IEowb8lBskr0qTdhLuouVAcP9wB4E6JRqgVenBZ9USEHrSGCLyKn6R6eIDL-XGT_7wrzFKw2rx35GJQ8OucsVXjzGUek4j0DjbUU-Nq8szUIs5WeMaPhcqZpO3T_auNs1UubwPaEubrm6xGKschWii27nyqfnzF8YSrO4?type=png)](https://mermaid.live/edit#pako:eNqdUbFOxDAM_RUrE4giwYY63AIjxwBrFytxe5FS-8514NDp_p20pSoHG54iv-eX9_ROzksgV7uBDpnY01PETrFvGMo8pkhst5vNzRZ1gFd5J62BjuSz0VV7PbNWbGQ-i0eLwjW0oh-oYZhZy_63GtPRgEVtBy36yB2kbybMh5gWfC-J5t04L2IEowb8lBskr0qTdhLuouVAcP9wB4E6JRqgVenBZ9USEHrSGCLyKn6R6eIDL-XGT_7wrzFKw2rx35GJQ8OucsVXjzGUek4j0DjbUU-Nq8szUIs5WeMaPhcqZpO3T_auNs1UubwPaEubrm6xGKschWii27nyqfnzF8YSrO4)
```mermaid
sequenceDiagram
    Client->>+Mars Rover: execute(f)
    Mars Rover->>+Location: forwards
    Location->>+Mars Rover: next north facing location 
    alt north pole
        Note over Mars Rover: south facing next longitude 180 degrees 
        Mars Rover->> Mars Rover: correction at north pole
    else
       Location->>+Mars Rover: next north facing location 
    end

```